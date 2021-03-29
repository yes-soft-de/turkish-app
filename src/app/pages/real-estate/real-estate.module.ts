import { NgModule } from '@angular/core';
import { ThemeModule } from 'src/app/@theme/theme.module';
import { RealEstateRoutingModule } from './real-estate-routing.module';
import { StoreModule } from '@ngrx/store';
import { EffectsModule } from '@ngrx/effects';

import { AllRealEstateComponent } from './components/all-real-estate/all-real-estate.component';
import * as fromRealEstate from './store/real-estate.reducer';
import { RealEstateEffects } from './store/real-estate.effects';
import { RealEstateDetailsComponent } from './components/real-estate-details/real-estate-details.component';


@NgModule({
  declarations: [ AllRealEstateComponent, RealEstateDetailsComponent ],
  imports: [
    ThemeModule,
    RealEstateRoutingModule,
    StoreModule.forFeature(fromRealEstate.realEstatesFeatureKey, fromRealEstate.reducer),
    EffectsModule.forFeature([RealEstateEffects])
  ]
})
export class RealEstateModule { }
