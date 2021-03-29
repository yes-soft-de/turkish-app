import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AllCarsComponent } from './components/all-cars/all-cars.component';
import {CarDetailsComponent} from './components/car-details/car-details.component';

const routes: Routes = [
  { path: '', component: AllCarsComponent },
  { path: ':id', component: CarDetailsComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CarsRoutingModule { }
