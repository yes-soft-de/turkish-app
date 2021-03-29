import { Component, OnInit } from '@angular/core';
import {select, Store} from '@ngrx/store';
import {ReportState} from '../../store/report.reducer';
import {ActivatedRoute} from '@angular/router';
import * as reportAction from '../../store/report.actions';
import {reportSelector} from '../../store/report.selector';
import {ReportDetails} from '../../model/report-details';

@Component({
  selector: 'app-report-details',
  templateUrl: './report-details.component.html',
  styleUrls: ['./report-details.component.scss']
})
export class ReportDetailsComponent implements OnInit {
  reportDetails: ReportDetails;

  constructor(private store: Store<ReportState>,
              private activatedRoute: ActivatedRoute) { }

  ngOnInit(): void {
    const reportID = Number(this.activatedRoute.snapshot.paramMap.get('id'));
    this.getReportDetails(reportID);
  }

  getReportDetails(reportId: number) {
    this.store.dispatch(reportAction.loadReport({ id: reportId }));
    this.store.pipe(select(reportSelector)).subscribe(data => this.reportDetails = data);
  }

}
