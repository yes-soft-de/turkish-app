import { Injectable } from '@angular/core';
import {Actions, createEffect, ofType} from '@ngrx/effects';
import {ChatsService} from '../services/chats.service';
import * as chatAction from './chat.actions';
import {catchError, map, mergeMap} from 'rxjs/operators';
import {of} from 'rxjs';


@Injectable()
export class ChatEffects {

  constructor(private actions$: Actions,
              private chatService: ChatsService) {}

  loadChats$ = createEffect(() => this.actions$.pipe(
    ofType(chatAction.loadChats),
    mergeMap(() => this.chatService.getAllChats()
      .pipe(
        map(response => chatAction.loadChatsSuccess(response)),
        catchError(error => of(chatAction.loadChatsFailure(error)))
      ))
  ));
}
