import { Action, createReducer, on } from '@ngrx/store';
import { EntityState, EntityAdapter, createEntityAdapter } from '@ngrx/entity';
import * as DeviceActions from './device.actions';
import { Device } from '../model/device';
import {DeviceDetails} from '../model/device-details';

export const devicesFeatureKey = 'devices';

export interface DeviceState extends EntityState<Device> {
  // additional entities state properties
  Data: Device[];
  selectedDevice: DeviceDetails;
  error: string;
}

export const adapter: EntityAdapter<Device> = createEntityAdapter<Device>();

export const initialState: DeviceState = adapter.getInitialState({
  // additional entity state properties
  Data: undefined,
  selectedDevice: undefined,
  error: undefined
});


export const reducer = createReducer(
  initialState,
  on(DeviceActions.loadDevicesSuccess,
    (state, action) => adapter.setAll(action.Data, state)
  ),
  on(DeviceActions.loadDevicesFailure,
    (state, action) => {
      return {
        ...state,
        error: action.error
      };
    }
  ),
  on(DeviceActions.loadDeviceSuccess,
  (state, action) => {
      return {
        ...state,
        selectedDevice: action.Data
      };
    }
  ),
  on(DeviceActions.loadDeviceFailure,
    (state, action) => {
      return {
        ...state,
        error: action.error
      };
    }
  ),
  on(DeviceActions.deleteDevice,
    (state, action) => adapter.removeOne(action.id, state)
  ),
  on(DeviceActions.deleteDeviceFailure,
    (state, action) => {
      return {
        ...state,
        error: action.error
      }
    }
  ),
  on(DeviceActions.addDevice,
    (state, action) => adapter.addOne(action.device, state)
  ),
  on(DeviceActions.upsertDevice,
    (state, action) => adapter.upsertOne(action.device, state)
  ),
  on(DeviceActions.addDevices,
    (state, action) => adapter.addMany(action.devices, state)
  ),
  on(DeviceActions.upsertDevices,
    (state, action) => adapter.upsertMany(action.devices, state)
  ),
  on(DeviceActions.updateDevice,
    (state, action) => adapter.updateOne(action.device, state)
  ),
  on(DeviceActions.updateDevices,
    (state, action) => adapter.updateMany(action.devices, state)
  ),
  on(DeviceActions.deleteDevices,
    (state, action) => adapter.removeMany(action.ids, state)
  ),
  on(DeviceActions.clearDevices,
    state => adapter.removeAll(state)
  ),
);


export const {
  selectIds,
  selectEntities,
  selectAll,
  selectTotal,
} = adapter.getSelectors();
