import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { TokenService } from '../../admin-service/token/token.service';
import { AdminConfig } from '../../AdminConfig';
import { ReportsResponse } from '../model/reports-response';
import {ReportDetailsResponse} from '../model/report-details-response';

@Injectable({
  providedIn: 'root'
})
export class ReportsService {


  constructor(private httpClient: HttpClient,
              private tokenService: TokenService) { }

  private static errorHandler(error: HttpErrorResponse) {
    return throwError(error || 'Server Error');
  }

  getReports(): Observable<ReportsResponse> {
    return this.httpClient.get<ReportsResponse>(
      AdminConfig.reportsAPI,
      this.tokenService.httpOptions()
    ).pipe(catchError(ReportsService.errorHandler));
  }

  getReportDetails(reportId: number): Observable<ReportDetailsResponse> {
    return this.httpClient.get<ReportDetailsResponse>(
      `${AdminConfig.reportAPI}/${reportId}`
    ).pipe(catchError(ReportsService.errorHandler));
  }

  deleteReport(reportId: string): Observable<any> {
    return this.httpClient.get<any>(
      `${AdminConfig.deleteReportAPI}/${reportId}`
    ).pipe(catchError(ReportsService.errorHandler));
  }
}
