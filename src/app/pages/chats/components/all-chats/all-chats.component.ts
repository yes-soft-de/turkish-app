import { Component, OnInit } from '@angular/core';
import {Observable} from 'rxjs';
import {Chat} from '../../model/chat.model';
import {select, Store} from '@ngrx/store';
import {ChatState} from '../../store/chat.reducer';
import * as chatAction from '../../store/chat.actions';
import {chatsSelector} from '../../store/chat.selector';
import * as carAction from '../../../cars/store/car.actions';
import {ToastrService} from 'ngx-toastr';
import {ChatsService} from '../../services/chats.service';

@Component({
  selector: 'app-all-chats',
  templateUrl: './all-chats.component.html',
  styleUrls: ['./all-chats.component.scss']
})
export class AllChatsComponent implements OnInit {
  chats: Chat[];
  chatsList: Chat[] = [];
  config: any;
  name: any;

  constructor(private store: Store<ChatState>,
              private chatService: ChatsService,
              private toaster: ToastrService) { }

  ngOnInit(): void {
    this.store.dispatch(chatAction.loadChats());
    // Get All Chats
    this.getAllChats();
  }

  getAllChats() {
    this.store.pipe(select(chatsSelector)).subscribe(
      response => {
        console.log('chats: ', response);
        this.chats = response;
        this.chatsList = response;
      }
    );
    this.config = {
      itemsPerPage: 5,
      currentPage: 1,
      totalItems: this.chatsList.length
    };
  }

  // Handle Response Error
  handleError(error) {
    console.log(error);
    if (error.error.error) {
      this.toaster.error(error.error.error);
    } else if (error.error.msg) {
      this.toaster.error(error.error.msg);
    }
  }

  // Fetch The Page Number On Page Change
  pageChanged(event) {
    this.config.currentPage = event;
  }

  // Delete The Cars
  delete(carId: number) {
    if (confirm('Are You Sure You Want To Delete This Chat')) {
      // this.isDeleted = true;
      // this.store.dispatch(carAction.deleteCar({id: carId}));
      // this.toaster.success('Car Successfully Deleted');
      // fetch all product after delete Car
      this.getAllChats();
    } else {
      return false;
    }
  }

  applyFilter() {
    // if the search input value is empty
    if (!this.name) {
      this.chatsList = [...this.chats];
    } else {
      this.chatsList = [];
      this.chatsList = this.chats.filter(res => {
        if (res.username) {
          const username = res.username.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (username) {
            // display the Name Column
            return username;
          }
        }
      });
    }
  }
}
