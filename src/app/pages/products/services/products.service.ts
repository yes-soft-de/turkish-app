import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { AdminConfig } from '../../AdminConfig';
import { CarsResponse } from '../model/cars-response';
import { DevicesResponse } from '../model/devices-response';
import { ProductDetailsResponse } from '../model/product-details-response';
import { ProductsResponse } from '../model/products-response';
import { RealEstateResponse } from '../model/real-estate-response';

@Injectable({
  providedIn: 'root'
})
export class ProductsService {

  constructor(private httpClient: HttpClient) { }

  private static errorHandler(error: HttpErrorResponse) {
    return throwError(error || 'Server Error');
  }

  getProducts(): Observable<ProductsResponse> {
    return this.httpClient.get<ProductsResponse>(
      AdminConfig.productsAPI
    ).pipe(catchError(ProductsService.errorHandler));
  }

  // all Cars
  // getAllCars(): Observable<CarsResponse> {
  //   return this.httpClient.get<CarsResponse>(
  //     AdminConfig.allCarsAPI
  //   ).pipe(catchError(ProductsService.errorHandler));
  // }

  // // all Devices
  // getAllDevices(): Observable<DevicesResponse> {
  //   return this.httpClient.get<DevicesResponse>(
  //     AdminConfig.allDevicesAPI
  //   ).pipe(catchError(ProductsService.errorHandler));
  // }

  // // all RealEstate
  // getAllRealEstate(): Observable<RealEstateResponse> {
  //   return this.httpClient.get<RealEstateResponse>(
  //     AdminConfig.allRealEstateAPI
  //   ).pipe(catchError(ProductsService.errorHandler));
  // }
}
