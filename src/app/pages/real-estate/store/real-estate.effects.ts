import { Injectable } from '@angular/core';
import { Actions, createEffect, ofType } from '@ngrx/effects';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';
import { catchError, map, mergeMap, tap } from 'rxjs/operators';
import { RealEstateService } from '../services/real-estate.service';
import * as realEstateAction from '../store/real-estate.actions';


@Injectable()
export class RealEstateEffects {

  constructor(private actions$: Actions,
              private realEstateService: RealEstateService,
              private toaster: ToastrService) {}

  // Load Real Estate
  loadRealEstates$ = createEffect(() => this.actions$.pipe(
    ofType(realEstateAction.loadRealEstates),
    mergeMap(() => this.realEstateService.getRealEstates()
      .pipe(
        map(response => realEstateAction.loadRealEstatesSuccess(response)),
        catchError(error => of(realEstateAction.loadRealEstatesFailure(error)))
      )
    )
  ));

  // Load Real Estate Details
  loadRealEstate$ = createEffect(() => this.actions$.pipe(
    ofType(realEstateAction.loadRealEstate),
    mergeMap(action => this.realEstateService.realEstateDetails(action.id)
      .pipe(
        map(response => realEstateAction.loadRealEstateSuccess(response)),
        catchError(error => of(realEstateAction.loadRealEstateFailure(error)))
      )
    )
  ));

  // Delete Real Estate Effect
  deleteRealEstate$ = createEffect(() => this.actions$.pipe(
    ofType(realEstateAction.deleteRealEstate),
    mergeMap(action => this.realEstateService.deleteRealEstates(action.id)
      .pipe(
        map(response => realEstateAction.deleteRealEstateSuccess({id: action.id})),
        catchError(error => of(realEstateAction.deleteRealEstateFailure({error})))
      )
    )
  ));
}
