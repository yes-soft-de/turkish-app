import { Injectable } from '@angular/core';
import {HttpClient, HttpErrorResponse} from '@angular/common/http';
import {interval, Observable, throwError} from 'rxjs';
import {AdminConfig} from '../../AdminConfig';
import {ChatsResponse} from '../model/chats-response';
import {catchError, map, startWith, switchMap} from 'rxjs/operators';
import {AngularFirestore, QuerySnapshot} from '@angular/fire/firestore';
import {MessageModel} from '../model/message-model';
import {TokenService} from '../../admin-service/token/token.service';
import {DatePipe} from '@angular/common';

@Injectable({
  providedIn: 'root'
})
export class ChatsService {

  constructor(private httpClient: HttpClient,
              private tokenService: TokenService,
              private datePipe: DatePipe,
              private firestore: AngularFirestore) { }

  private static errorHandler(error: HttpErrorResponse) {
    return throwError(error || 'Server Error');
  }

  getAllChats(): Observable<ChatsResponse> {
    return this.httpClient.get<ChatsResponse>(
      AdminConfig.chatsAPI,
      this.tokenService.httpOptions()
    ).pipe(catchError(ChatsService.errorHandler));
  }

  // This sends the message
  sendMessage(chatRoomId: string, message: string, clientId: string): void {
    const chatMsg: MessageModel = {
      msg: message,
      sender: clientId,
      sentDate: this.datePipe.transform(new Date(), 'yyyy-MM-ddTHH:mm:ss', 'TZD').toString()
    };

    this.firestore.collection('chat_rooms')
      .doc(chatRoomId)
      .collection('messages').add(chatMsg);
  }

  // This Listens to messages changes in the chat room
  getMessagesObservable(chatRoomId: string): Observable<QuerySnapshot<any>> {
    if (chatRoomId) {
      return interval(1000).pipe(
        startWith(0),
        switchMap(() => this.firestore.collection('chat_rooms')
          .doc(chatRoomId).collection('messages').get())
      );
    }
  }
}
