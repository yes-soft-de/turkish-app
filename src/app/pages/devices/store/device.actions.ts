import { createAction, props } from '@ngrx/store';
import { Update } from '@ngrx/entity';
import { Device } from '../model/device';
import {DeviceDetails} from '../model/device-details';


export const loadDevices = createAction(
  '[Device/API] Load Devices'
);

export const loadDevicesSuccess = createAction(
  '[Device/API] Load Devices Success',
  props<{ Data: Device[] }>()
);

export const loadDevicesFailure = createAction(
  '[Device/API] Load Devices Failure',
  props<{ error: string }>()
);

export const loadDevice = createAction(
  '[Device Components/API] Load Device',
  props<{ id: number }>()
);

export const loadDeviceSuccess = createAction(
  '[Device Effect/API] Load Device Success',
  props<{ Data: DeviceDetails }>()
);

export const loadDeviceFailure = createAction(
  '[Device Effect/API] Load Device Failure',
  props<{ error: string }>()
);

export const deleteDevice = createAction(
  '[Device Component/API] Delete Device',
  props<{ id: number }>()
);

export const deleteDeviceSuccess = createAction(
  '[Device Effect/API] Delete Device Success',
  props<{ id: number }>()
);

export const deleteDeviceFailure = createAction(
  '[Device Effect/API] Delete Device Failure',
  props<{ error: string }>()
);

export const addDevice = createAction(
  '[Device/API] Add Device',
  props<{ device: Device }>()
);

export const upsertDevice = createAction(
  '[Device/API] Upsert Device',
  props<{ device: Device }>()
);

export const addDevices = createAction(
  '[Device/API] Add Devices',
  props<{ devices: Device[] }>()
);

export const upsertDevices = createAction(
  '[Device/API] Upsert Devices',
  props<{ devices: Device[] }>()
);

export const updateDevice = createAction(
  '[Device/API] Update Device',
  props<{ device: Update<Device> }>()
);

export const updateDevices = createAction(
  '[Device/API] Update Devices',
  props<{ devices: Update<Device>[] }>()
);

export const deleteDevices = createAction(
  '[Device/API] Delete Devices',
  props<{ ids: string[] }>()
);

export const clearDevices = createAction(
  '[Device/API] Clear Devices'
);
