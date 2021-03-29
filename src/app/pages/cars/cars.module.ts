import { NgModule } from '@angular/core';
import { ThemeModule } from 'src/app/@theme/theme.module';
import { StoreModule } from '@ngrx/store';
import { EffectsModule } from '@ngrx/effects';
import { CarsRoutingModule } from './cars-routing.module';

import * as fromCars from './store/car.reducer';
import { CarEffects } from './store/car.effects';
import { AllCarsComponent } from './components/all-cars/all-cars.component';
import { CarDetailsComponent } from './components/car-details/car-details.component';


@NgModule({
  declarations: [ AllCarsComponent, CarDetailsComponent ],
  imports: [
    ThemeModule,
    CarsRoutingModule,
    StoreModule.forFeature(fromCars.carsFeatureKey, fromCars.reducer),
    EffectsModule.forFeature([CarEffects])
  ]
})
export class CarsModule { }
