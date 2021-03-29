import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {AllChatsComponent} from './components/all-chats/all-chats.component';
import {ChatDetailsComponent} from './components/chat-details/chat-details.component';


const routes: Routes = [
  { path: '', component: AllChatsComponent },
  { path: ':id', component: ChatDetailsComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ChatsRoutingModule { }
