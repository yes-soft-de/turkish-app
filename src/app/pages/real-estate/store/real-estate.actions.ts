import { createAction, props } from '@ngrx/store';
import { RealEstate } from '../model/real-estate.model';
import {RealEstateDetails} from '../model/real-estate-details';


export const loadRealEstates = createAction(
  '[RealEstate/API] Load RealEstates'
);

export const loadRealEstatesSuccess = createAction(
  '[RealEstate/API] Load RealEstates Success',
  props<{ Data: RealEstate[] }>()
);

export const loadRealEstatesFailure = createAction(
  '[RealEstate/API] Load RealEstates Failure',
  props<{ error: string }>()
);

export const loadRealEstate = createAction(
  '[RealEstate Components/API] Load Real Estate',
  props<{ id: number }>()
);

export const loadRealEstateSuccess = createAction(
  '[RealEstate Effect/API] Load Real Estate Success',
  props<{ Data: RealEstateDetails }>()
);

export const loadRealEstateFailure = createAction(
  '[RealEstate Effect/API] Load Real Estate Failure',
  props<{ error: string }>()
);

export const deleteRealEstate = createAction(
  '[RealEstate Components/API] Delete RealEstate',
  props<{ id: number }>()
);

export const deleteRealEstateSuccess = createAction(
  '[RealEstate Effect/API] Delete RealEstate Success',
  props<{ id: number }>()
);

export const deleteRealEstateFailure = createAction(
  '[RealEstate Effect/API] Delete RealEstate Failure',
  props<{ error: string }>()
);
