import { Action, createReducer, on } from '@ngrx/store';
import { EntityState, EntityAdapter, createEntityAdapter } from '@ngrx/entity';
import { Chat } from '../model/chat.model';
import * as ChatActions from './chat.actions';

export const chatsFeatureKey = 'chats';

export interface ChatState extends EntityState<Chat> {
  // additional entities state properties
  Data: Chat[];
  error: string;
}

export const adapter: EntityAdapter<Chat> = createEntityAdapter<Chat>();

export const initialState: ChatState = adapter.getInitialState({
  // additional entity state properties
  Data: undefined,
  error: undefined
});


export const reducer = createReducer(
  initialState,
  on(ChatActions.loadChatsSuccess,
    (state, action) => adapter.setAll(action.Data, state)
  ),
  on(ChatActions.loadChatsFailure,
    (state, action) => {
      return {
        ...state,
        error: action.error
      };
    }
  )
);


export const {
  selectIds,
  selectEntities,
  selectAll,
  selectTotal,
} = adapter.getSelectors();
