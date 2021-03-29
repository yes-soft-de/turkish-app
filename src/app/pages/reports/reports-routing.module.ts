import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AllReportsComponent } from './components/all-reports/all-reports.component';
import {ReportDetailsComponent} from './components/report-details/report-details.component';

const routes: Routes = [
  { path: '', component: AllReportsComponent },
  { path: ':id', component: ReportDetailsComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ReportsRoutingModule { }
