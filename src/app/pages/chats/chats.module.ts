import { NgModule } from '@angular/core';
import {ThemeModule} from '../../@theme/theme.module';

import { ChatsRoutingModule } from './chats-routing.module';
import { AllChatsComponent } from './components/all-chats/all-chats.component';
import { StoreModule } from '@ngrx/store';
import * as fromChat from './store/chat.reducer';
import { EffectsModule } from '@ngrx/effects';
import { ChatEffects } from './store/chat.effects';
import { ChatDetailsComponent } from './components/chat-details/chat-details.component';
import {DatePipe} from '@angular/common';
import {ChatsService} from './services/chats.service';


@NgModule({
  declarations: [AllChatsComponent, ChatDetailsComponent],
  imports: [
    ThemeModule,
    ChatsRoutingModule,
    StoreModule.forFeature(fromChat.chatsFeatureKey, fromChat.reducer),
    EffectsModule.forFeature([ChatEffects])
  ],
  providers: [ChatsService, DatePipe]
})
export class ChatsModule { }
