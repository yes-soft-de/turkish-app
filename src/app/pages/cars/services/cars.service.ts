import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { AdminConfig } from '../../AdminConfig';
import { CarsResponse } from '../model/cars-response';
import {CarResponse} from '../model/car-response';


@Injectable({
  providedIn: 'root'
})
export class CarsService {

  constructor(private httpClient: HttpClient) { }

  private static errorHandler(error: HttpErrorResponse) {
    return throwError(error || 'Server Error');
  }

  // all Cars
  getAllCars(): Observable<CarsResponse> {
    return this.httpClient.get<CarsResponse>(
      AdminConfig.allCarsAPI
    ).pipe(catchError(CarsService.errorHandler));
  }

  // Car Details
  getCarDetails(carId: number ): Observable<CarResponse> {
    return this.httpClient.get<CarResponse>(
      `${AdminConfig.getCarAPI}/${carId}`
    ).pipe(catchError(CarsService.errorHandler));
  }

  // Delete Car
  deleteCar(carId: number): Observable<any> {
    return this.httpClient.delete<any>(
      `${AdminConfig.deleteCarAPI}/${carId}`
    ).pipe(catchError(CarsService.errorHandler));
  }
}
