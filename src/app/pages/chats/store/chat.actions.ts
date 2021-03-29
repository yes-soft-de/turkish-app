import { createAction, props } from '@ngrx/store';
import { Update } from '@ngrx/entity';

import { Chat } from '../model/chat.model';

export const loadChats = createAction(
  '[Chat/API] Load Chats'
);

export const loadChatsSuccess = createAction(
  '[Chat/API] Load Chats Success',
  props<{ Data: any }>()
);

export const loadChatsFailure = createAction(
  '[Chat/API] Load Chats Failure',
  props<{ error: string }>()
);
