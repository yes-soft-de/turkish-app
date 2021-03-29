import { createAction, props } from '@ngrx/store';
import { Update } from '@ngrx/entity';
import { Cars } from '../model/cars';
import {Car} from '../model/car-model';

export const loadCars = createAction(
  '[Car/API] Load Cars'
);

export const loadCarsSuccess = createAction(
  '[Car/API] Load Cars Success',
  props<{ Data: Cars[] }>()
);

export const loadCarsFailure = createAction(
  '[Car/API] Load Cars Failure',
  props<{ error: string }>()
);

export const loadCar = createAction(
  '[Car Components/API] Load Car',
  props<{ id: number }>()
);

export const loadCarSuccess = createAction(
  '[Car Effect/API] Load Car Success',
  props<{ Data: Car }>()
);

export const loadCarFailure = createAction(
  '[Car/API] Load Car Failure',
  props<{ error: string }>()
);


export const deleteCar = createAction(
  '[Car Components/API] Delete Car',
  props<{ id: number }>()
);

export const deleteCarSuccess = createAction(
  '[Car Effect/API] Delete Car Success',
  props<{ id: number }>()
);

export const deleteCarFailure = createAction(
  '[Car Effect/API] Delete Car Failure',
  props<{ error: string }>()
);
