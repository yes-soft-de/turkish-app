import { Injectable } from '@angular/core';
import { Actions, createEffect, ofType } from '@ngrx/effects';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';
import { catchError, map, mergeMap, tap } from 'rxjs/operators';
import { DevicesService } from '../services/devices.service';
import * as deviceActions from './device.actions';


@Injectable()
export class DeviceEffects {

  constructor(private actions$: Actions,
              private toaster: ToastrService,
              private deviceService: DevicesService) {}


  loadDevices$ = createEffect(() => this.actions$.pipe(
    ofType(deviceActions.loadDevices),
    mergeMap(() => this.deviceService.getDevices()
      .pipe(
        map(devicesResponse => deviceActions.loadDevicesSuccess(devicesResponse)),
        catchError(error => of(deviceActions.loadDevicesFailure(error)))
      )
    )
  ));

  // Load Device Effect
  loadDevice$ = createEffect(() => this.actions$.pipe(
    ofType(deviceActions.loadDevice),
    mergeMap(action => this.deviceService.deviceDetails(action.id)
      .pipe(
        map(response => deviceActions.loadDeviceSuccess(response)),
        catchError(error => of(deviceActions.loadDeviceFailure(error)))
      ))
  ));

  // Delete Device Effect
  deleteDevice$ = createEffect(() => this.actions$.pipe(
    ofType(deviceActions.deleteDevice),
    mergeMap(action => this.deviceService.deleteDevice(action.id)
      .pipe(
        map(response => deviceActions.deleteDeviceSuccess({id: action.id})),
        catchError(error => of(deviceActions.deleteDeviceFailure(error)))
      )
    )
  ));
}
