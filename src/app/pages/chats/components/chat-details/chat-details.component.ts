import {Component, Inject, OnDestroy, OnInit, Renderer2} from '@angular/core';
import { Action, DocumentSnapshot } from '@angular/fire/firestore';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import {interval, Observable, pipe, Subject} from 'rxjs';
import {takeUntil, takeWhile, timeInterval} from 'rxjs/operators';
import {MessageModel} from '../../model/message-model';
import {ChatsService} from '../../services/chats.service';
import {DOCUMENT} from '@angular/common';
import {TranslateService} from '@ngx-translate/core';

@Component({
  selector: 'app-chat-details',
  templateUrl: './chat-details.component.html',
  styleUrls: ['./chat-details.component.scss']
})
export class ChatDetailsComponent implements OnInit, OnDestroy {
  private destroy$: Subject<void> = new Subject();
  messageForm: FormGroup;
  messages: MessageModel[];
  firstSender: any;
  secondSender: any;


  constructor(private chatService: ChatsService,
              private formBuilder: FormBuilder,
              private toaster: ToastrService,
              private activatedRoute: ActivatedRoute,
              public translate: TranslateService,
              private render: Renderer2,
              @Inject(DOCUMENT) private document: Document) {}

  ngOnInit(): void {
    this.checkMessageBodyScrollHeight();
    // Fetch Form Data
    this.messageForm = this.formBuilder.group({
      message: ['', Validators.required],
      roomId: ['']
    });

    this.activatedRoute.params.subscribe(
      params => {
        console.log(params);
        this.getMessages(params.id);
      }
    );

  }

  getMessages(roomId: string) {
    // Check Room Id exists
    if (roomId) {
      this.messageForm.get('roomId').setValue(roomId);
      this.chatService.getMessagesObservable(roomId)
      .pipe(
        takeUntil(this.destroy$))
      .subscribe(
        (messages) => {
          // console.log('messages: ', messages);
          this.messages = [];
          messages.docs.forEach((e, i) => {
            // Get ALl Message by e.data()
            this.messages.push(e.data());
          });
          // Sort Messages Depending On Message Date
          this.messages.sort((a, b) => a.sentDate.localeCompare(b.sentDate));
          // console.log('after sort Messages : ', this.messages);
          // Check if the messages is not empty
          if (this.messages.length > 0) {
            this.secondSender = 'admin';
            for (let i = 0; i < this.messages.length - 1; i++) {
              // check if firstSender And secondSender still empty
              if (this.firstSender == null) {
                // Check if the this sender equal to next sender
                if (this.messages[i].sender != this.secondSender) {
                  this.firstSender = this.messages[i].sender;
                }
              }
              /* Second Way If firstSender And SecondSender is Undefined
              if (this.firstSender == null || this.secondSender == null) {
                // Check if the this sender equal to next sender
                if (this.messages[i].sender == this.messages[i + 1].sender) {
                  this.firstSender = this.messages[i].sender;
                } else {
                  // check if this sender not equal to The stored firstSender
                  if (this.messages[i].sender != this.firstSender) {
                    this.secondSender = this.messages[i].sender;
                  } else {
                    this.secondSender = this.messages[i + 1].sender;
                  }
                }
              }*/
            }}
        }, error => console.log('Error ', error),
        () => {
          // Sort Messages Depending On Message Date
          this.messages.sort((a, b) => a.sentDate.localeCompare(b.sentDate));
          console.log('after sort Messages : ', this.messages);
          // Check if the messages is not empty
          if (this.messages.length > 0) {
            this.secondSender = 'admin';
            for (let i = 0; i < this.messages.length - 1; i++) {
              // check if firstSender And secondSender still empty
              if (this.firstSender == null) {
                // Check if the this sender equal to next sender
                if (this.messages[i].sender != this.secondSender) {
                  this.firstSender = this.messages[i].sender;
                }
              }
              /* Second Way If firstSender And SecondSender is Undefined
              if (this.firstSender == null || this.secondSender == null) {
                // Check if the this sender equal to next sender
                if (this.messages[i].sender == this.messages[i + 1].sender) {
                  this.firstSender = this.messages[i].sender;
                } else {
                  // check if this sender not equal to The stored firstSender
                  if (this.messages[i].sender != this.firstSender) {
                    this.secondSender = this.messages[i].sender;
                  } else {
                    this.secondSender = this.messages[i + 1].sender;
                  }
                }
              }*/
            }
            console.log('firstSender : ', this.firstSender);
            console.log('secondSender : ', this.secondSender);
          }
        }
      );
    }
  }


  // Scroll to latest message when messages display
  checkMessageBodyScrollHeight() {
    const elementExists = setInterval(() => {
      const messageBody = this.document.querySelector('.messages-body');
      if (messageBody.scrollHeight > 40) {
        messageBody.scrollTop = messageBody.scrollHeight;
        clearInterval(elementExists);
      }
    }, 100);
  }

  checkMessageDirectionForRtl() {
    if (true) {
      const elementExists = setInterval(() => {
        const messageBody = this.document.querySelector('.messages-body');
        if (messageBody.scrollHeight > 40) {
          messageBody.scrollTop = messageBody.scrollHeight;
          clearInterval(elementExists);
        }
      }, 100);
    }
  }

  ngOnDestroy() {
    this.destroy$.next();
    this.destroy$.complete();
  }

  onSubmit() {
    if (!this.messageForm.valid) {
      this.toaster.error('Error : Can\'t Send An Empty Message');
    } else {
      const formMessages = this.messageForm.getRawValue();
      console.log(formMessages);
      if (formMessages.roomId) {
        this.chatService.sendMessage(formMessages.roomId, formMessages.message, 'admin');
      } else {
        this.toaster.error('Error, Please Try Later');
      }
      this.messageForm.reset();
      this.getMessages(formMessages.roomId);
    }
  }
}
