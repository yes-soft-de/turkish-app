import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { AdminConfig } from '../../AdminConfig';

@Injectable({
  providedIn: 'root'
})
export class RealEstateService {

  constructor(private httpClient: HttpClient) { }

  private static errorHandler(error: HttpErrorResponse) {
    return throwError(error || 'Server Error');
  }

  // all RealEstate
  getRealEstates(): Observable<any> {
    return this.httpClient.get<any>(
      AdminConfig.allRealEstateAPI
    ).pipe(catchError(RealEstateService.errorHandler));
  }


  // RealEstate Details
  realEstateDetails(realEstateID: number): Observable<any> {
    return this.httpClient.get<any>(
      `${AdminConfig.getRealEstateAPI}/${realEstateID}`
    ).pipe(catchError(RealEstateService.errorHandler));
  }

  // Delete Real Estate
  deleteRealEstates(deviceId: number): Observable<any> {
    return this.httpClient.delete<any>(
      `${AdminConfig.deleteRealEstateAPI}/${deviceId}`
    ).pipe(catchError(RealEstateService.errorHandler));
  }

}
