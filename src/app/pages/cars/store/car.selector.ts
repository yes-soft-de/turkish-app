import { createFeatureSelector, createSelector } from "@ngrx/store";
import { carsFeatureKey, CarState } from "./car.reducer";
import { selectAll } from "./car.reducer";

// fetch the whole slice for product state
export const selectCarState = createFeatureSelector<CarState>(carsFeatureKey);

export const carsSelector = createSelector(selectCarState, selectAll);

export const carSelector = createSelector(selectCarState, (state: CarState) => state.selectedCar);

