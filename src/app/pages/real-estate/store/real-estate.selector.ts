import { createFeatureSelector, createSelector } from "@ngrx/store";
import { realEstatesFeatureKey, RealEstateState, selectAll } from "./real-estate.reducer";

const realEstateFeatureState = createFeatureSelector<RealEstateState>(realEstatesFeatureKey);
// real estates selector
export const realEstatesSelector = createSelector(realEstateFeatureState, selectAll);

// real estate details selector
export const realEstateSelector = createSelector(realEstateFeatureState, (state: RealEstateState) => state.selectedRealEstate);

// real estate error selector
export const getRealEstateError = createSelector(realEstateFeatureState, (state: RealEstateState) => state.error);
