import { Injectable } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Actions, createEffect, ofType } from '@ngrx/effects';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';
import { catchError, concatMap, map, mergeMap, tap } from 'rxjs/operators';
import { CarsService } from '../services/cars.service';
import * as carActions from './car.actions';


@Injectable()
export class CarEffects {

  constructor(private actions$: Actions,
              private carService: CarsService,
              private toaster: ToastrService) {}

  // Load Cars Effect
  loadCars$ = createEffect(() => this.actions$.pipe(
    ofType(carActions.loadCars),
    mergeMap(() => this.carService.getAllCars()
      .pipe(
        map(carsResponse => carActions.loadCarsSuccess(carsResponse)),
        catchError(error => of(carActions.loadCarsFailure(error)))
      )
    )
  ));

  loadCar$ = createEffect(() => this.actions$.pipe(
    ofType(carActions.loadCar),
    mergeMap(action => this.carService.getCarDetails(action.id)
      .pipe(
        map(response => carActions.loadCarSuccess(response)),
        catchError(error => of(carActions.loadCarFailure({error})))
      )
    )
  ));

  // Delete Car Effect
  deleteCar$ = createEffect(() => this.actions$.pipe(
    ofType(carActions.deleteCar),
    mergeMap(action => this.carService.deleteCar(action.id)
      .pipe(
        map(response => carActions.deleteCarSuccess({id: action.id})),
        catchError(error => of(carActions.deleteCarFailure(error)))
      )
    )
  ));

}
