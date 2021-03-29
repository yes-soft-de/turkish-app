import { Injectable } from '@angular/core';
import {Actions, createEffect, ofType} from '@ngrx/effects';
import {ReportsService} from '../services/reports.service';
import * as reportsAction from './report.actions';
import {catchError, map, mergeMap, tap} from 'rxjs/operators';
import {of} from 'rxjs';
import { ToastrService } from 'ngx-toastr';


@Injectable()
export class ReportEffects {

  constructor(private actions$: Actions, 
              private reportService: ReportsService,
              private toaster: ToastrService) {}

  // Effects Get Reports
  loadReports$ = createEffect(() => this.actions$.pipe(
    ofType(reportsAction.loadReports),
    mergeMap(() => this.reportService.getReports()
      .pipe(
        map(response => reportsAction.loadReportsSuccess(response)),
        catchError(error => of(reportsAction.loadReportsFailure(error)))
      )
    )
  ));

  // Effects Get Reports
  loadReport$ = createEffect(() => this.actions$.pipe(
    ofType(reportsAction.loadReport),
    mergeMap(action => this.reportService.getReportDetails(action.id)
      .pipe(
        map(response => reportsAction.loadReportSuccess(response)),
        catchError(error => of(reportsAction.loadReportFailure(error)))
      )
    )
  ));

  // Effect Delete Report
  deleteReport$ = createEffect(() => this.actions$.pipe(
    ofType(reportsAction.deleteReport),
    mergeMap(action => this.reportService.deleteReport(action.id)
      .pipe(
        map(response => reportsAction.deleteReportSuccess({id: action.id})),
        catchError(error => of(reportsAction.deleteReportFailure(error)))
      )
    )
  ));
}
