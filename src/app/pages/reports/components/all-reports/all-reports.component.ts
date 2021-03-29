import { DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { ReportsResponse } from '../../model/reports-response';
import { ReportsService } from '../../services/reports.service';
import {select, Store} from '@ngrx/store';
import {ReportState} from '../../store/report.reducer';
import * as reportAction from '../../store/report.actions';
import * as reportsSelector from '../../store/report.selector';
import { Reports } from '../../model/reports.model';

@Component({
  selector: 'app-all-reports',
  templateUrl: './all-reports.component.html',
  styleUrls: ['./all-reports.component.scss']
})
export class AllReportsComponent implements OnInit {
  reports: Reports[];
  reportsList: Reports[] = [];
  reportsFilterList: Reports[] = [];          // We Create It Second For Filter
  currentAnimeID: number;
  episodeDuration: any;
  isDeleted = false;
  config: any;                                // Config Variable For Pagination Configuration
  name: string;
  isClicked = false;
  reportSubscription: Subscription;

  constructor(private store: Store<ReportState>,
              private toaster: ToastrService) { }

  ngOnInit() {
    this.store.dispatch(reportAction.loadReports());
    // Get All reports
    this.getReports();
  }

  // Get All reports
  getReports() {
    this.store.pipe(select(reportsSelector.reportsSelector)).subscribe(
      reportsResponse => {
        console.log(reportsResponse);
        this.reports = reportsResponse;
        this.reportsList = reportsResponse;
        this.reportsFilterList = reportsResponse;
      },
      error => this.handleError(error)
    );
    this.config = {
      itemsPerPage: 5,
      currentPage: 1,
      totalItems: this.reportsList.length
    };
  }

  // Handle Response Error
  handleError(error) {
    this.isClicked = false;
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

  // Delete The Report
  delete(reportId: string) {
    if (confirm('Are You Sure You Want To Delete This Report')) {
      this.isDeleted = true;
      this.store.dispatch(reportAction.deleteReport({id: reportId}));
      this.toaster.success('Report Successfully Deleted');
      setTimeout(() => { this.isDeleted = true; }, 1000);
    } else {
      return false;
    }
  }


  applyFilter() {
    // if the search input value is empty
    if (!this.name) {
      this.reportsFilterList = [...this.reportsList];
    } else {
      this.reportsFilterList = [];
      this.reportsFilterList = this.reportsList.filter(res => {
        if (res.userName) {
          const userName = res.userName.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (userName) {
            // display the Name Column
            return userName;
          }
        }
        if (res.entity) {
          const entity = res.entity.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (entity) {
            // display the Name Column
            return entity;
          }
        }
        if (res.itemName) {
          const itemName = res.itemName.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (itemName) {
            // display the Name Column
            return itemName;
          }
        }
      });
    }
  }
}
