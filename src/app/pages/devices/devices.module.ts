import { NgModule } from '@angular/core';
import { ThemeModule } from 'src/app/@theme/theme.module';

import { DevicesRoutingModule } from './devices-routing.module';
import { AllDevicesComponent } from './components/all-devices/all-devices.component';
import { StoreModule } from '@ngrx/store';
import * as fromDevice from './store/device.reducer';
import { EffectsModule } from '@ngrx/effects';
import { DeviceEffects } from './store/device.effects';
import { DeviceDetailsComponent } from './components/device-details/device-details.component';


@NgModule({
  declarations: [AllDevicesComponent, DeviceDetailsComponent],
  imports: [
    ThemeModule,
    DevicesRoutingModule,
    StoreModule.forFeature(fromDevice.devicesFeatureKey, fromDevice.reducer),
    EffectsModule.forFeature([DeviceEffects])
  ]
})
export class DevicesModule { }
