import { createFeatureSelector, createSelector } from "@ngrx/store";
import { devicesFeatureKey, DeviceState, selectAll } from "./device.reducer";
import {carsFeatureKey} from '../../cars/store/car.reducer';

const deviceFeatureState = createFeatureSelector<DeviceState>(devicesFeatureKey);

export const allDevicesSelector = createSelector(deviceFeatureState, selectAll);
export const allDevicesAndCarsSelector = createSelector(
  deviceFeatureState, selectAll);

export const deviceDetailsSelector = createSelector(deviceFeatureState, (state: DeviceState) => state.selectedDevice);

export const getDevicesError = createSelector(deviceFeatureState, (state: DeviceState) => state.error);

