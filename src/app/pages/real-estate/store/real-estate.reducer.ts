import { Action, createReducer, on } from '@ngrx/store';
import { EntityState, EntityAdapter, createEntityAdapter } from '@ngrx/entity';
import { RealEstate } from '../model/real-estate.model';
import * as RealEstateActions from './real-estate.actions';
import {RealEstateDetails} from '../model/real-estate-details';

export const realEstatesFeatureKey = 'realEstates';

export interface RealEstateState extends EntityState<RealEstate> {
  // additional entities state properties
  Data: RealEstate[];
  selectedRealEstate: RealEstateDetails;
  error: string;
}

export const adapter: EntityAdapter<RealEstate> = createEntityAdapter<RealEstate>();

export const initialState: RealEstateState = adapter.getInitialState({
  // additional entity state properties
  Data: undefined,
  selectedRealEstate: undefined,
  error: undefined
});


export const reducer = createReducer(
  initialState,
  on(RealEstateActions.loadRealEstatesSuccess,
    (state, action) => adapter.setAll(action.Data, state)
  ),
  on(RealEstateActions.loadRealEstatesFailure,
    (state, action) => {
      return {
        ...state,
        error: action.error
      };
    }
  ),
  on(RealEstateActions.loadRealEstateSuccess,
    (state, action) => {
      return {
        ...state,
        selectedRealEstate: action.Data
      };
    }
  ),
  on(RealEstateActions.loadRealEstateFailure,
    (state, action) => {
      return {
        ...state,
        error: action.error
      };
    }
  ),
  on(RealEstateActions.deleteRealEstate,
    (state, action) => adapter.removeOne(action.id, state)
  )
);


export const {
  selectIds,
  selectEntities,
  selectAll,
  selectTotal,
} = adapter.getSelectors();
