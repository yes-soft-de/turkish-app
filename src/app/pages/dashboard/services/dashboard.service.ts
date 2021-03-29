import { Injectable } from '@angular/core';
import {HttpClient, HttpErrorResponse} from '@angular/common/http';
import {Observable, throwError} from 'rxjs';
import {AdminConfig} from '../../AdminConfig';
import {ReportsResponse} from '../../reports/model/reports-response';
import {catchError} from 'rxjs/operators';
import {TokenService} from '../../admin-service/token/token.service';
import {CarsResponse} from '../../cars/model/cars-response';
import {DeviceResponse} from '../../devices/model/device-response';
import {StatisticsResponse} from '../model/statistics-response';

@Injectable({
  providedIn: 'root'
})
export class DashboardService {

  constructor(private httpClient: HttpClient,
              private tokenService: TokenService) { }


  private static errorHandler(error: HttpErrorResponse) {
    return throwError(error || 'Server Error');
  }

  // all Devices
  getDevices(): Observable<DeviceResponse> {
    return this.httpClient.get<DeviceResponse>(
      AdminConfig.allDevicesAPI
    ).pipe(catchError(DashboardService.errorHandler));
  }

  // all Cars
  getAllCars(): Observable<CarsResponse> {
    return this.httpClient.get<CarsResponse>(
      AdminConfig.allCarsAPI
    ).pipe(catchError(DashboardService.errorHandler));
  }


  getReports(): Observable<ReportsResponse> {
    return this.httpClient.get<ReportsResponse>(
      AdminConfig.reportsAPI,
      this.tokenService.httpOptions()
    ).pipe(catchError(DashboardService.errorHandler));
  }

  // All Statistics
  allStatistics(): Observable<StatisticsResponse> {
    return this.httpClient.get<StatisticsResponse>(
      AdminConfig.statisticsAPI
    ).pipe(catchError(DashboardService.errorHandler));
  }

}
