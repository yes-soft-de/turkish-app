import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { AdminConfig } from '../../AdminConfig';
import { DeviceResponse } from '../model/device-response';
import {DeviceDetailsResponse} from '../model/device-details-response';

@Injectable({
  providedIn: 'root'
})
export class DevicesService {


  constructor(private httpClient: HttpClient) { }

  private static errorHandler(error: HttpErrorResponse) {
    return throwError(error || 'Server Error');
  }


  // all Devices
  getDevices(): Observable<DeviceResponse> {
    return this.httpClient.get<DeviceResponse>(
      AdminConfig.allDevicesAPI
    ).pipe(catchError(DevicesService.errorHandler));
  }

  // Car Details
  deviceDetails(deviceID: number): Observable<DeviceDetailsResponse> {
    return this.httpClient.get<DeviceDetailsResponse>(
      `${AdminConfig.getDeviceAPI}/${deviceID}`
    );
  }

  // Delete Device
  deleteDevice(deviceId: number): Observable<any> {
    return this.httpClient.delete<any>(
      `${AdminConfig.deleteDeviceAPI}/${deviceId}`
    ).pipe(catchError(DevicesService.errorHandler));
  }
}
