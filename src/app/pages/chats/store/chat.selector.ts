import {createFeatureSelector, createSelector} from '@ngrx/store';
import {chatsFeatureKey, ChatState, selectAll} from './chat.reducer';

const chatFeatureState = createFeatureSelector<ChatState>(chatsFeatureKey);

export const chatsSelector = createSelector(chatFeatureState, selectAll);
