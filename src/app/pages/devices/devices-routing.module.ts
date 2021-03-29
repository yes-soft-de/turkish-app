import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AllDevicesComponent } from './components/all-devices/all-devices.component';
import {DeviceDetailsComponent} from './components/device-details/device-details.component';


const routes: Routes = [
  { path: '', component: AllDevicesComponent },
  { path: ':id', component: DeviceDetailsComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DevicesRoutingModule { }
