import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AllRealEstateComponent } from './components/all-real-estate/all-real-estate.component';
import {RealEstateDetailsComponent} from './components/real-estate-details/real-estate-details.component';


const routes: Routes = [
  { path: '', component: AllRealEstateComponent },
  { path: ':id', component: RealEstateDetailsComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class RealEstateRoutingModule { }
