import { Action, createReducer, MetaReducer, on } from '@ngrx/store';
import { EntityState, EntityAdapter, createEntityAdapter } from '@ngrx/entity';
import { environment } from 'src/environments/environment';
import * as CarAction from './car.actions';
import { Cars } from '../model/cars';
import {Car} from '../model/car-model';

export const carsFeatureKey = 'cars';

export interface CarState extends EntityState<Cars> {
  // additional entities state properties
  Data: Cars[];
  selectedCar: Car;
  error: any;
}

export const adapter: EntityAdapter<Cars> = createEntityAdapter<Cars>();

export const initialState: CarState = adapter.getInitialState({
  // additional entity state properties
  Data: undefined,
  selectedCar: undefined,
  error: undefined
});


export const reducer = createReducer(
  initialState,

  on(CarAction.loadCarsSuccess,
    (state, action) => adapter.setAll(action.Data, state)
  ),
  on(CarAction.loadCarsFailure,
    (state, action) => {
      return {
        ...state,
        error: action.error
      };
    }
  ),
  on(CarAction.loadCarSuccess,
    (state, action) => {
      return {
        ...state,
        selectedCar: action.Data
      };
    }
  ),
  on(CarAction.loadCarFailure,
    (state, action) => {
      return {
        ...state,
        error: action.error
      };
    }
  ),
  on(CarAction.deleteCarSuccess,
    (state, action) => adapter.removeOne(action.id, state)
  ),
  on(CarAction.deleteCarFailure,
    (state, action) => {
      return {
        ...state,
        error: action.error
      };
    }
  )
);

export const metaReducers: MetaReducer<CarState>[] = !environment.production ? [] : [];

export const {
  selectIds,
  selectEntities,
  selectAll,
  selectTotal,
} = adapter.getSelectors();
