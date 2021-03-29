import { NgModule } from '@angular/core';
import { ThemeModule } from 'src/app/@theme/theme.module';

import { ReportsRoutingModule } from './reports-routing.module';
import { AllReportsComponent } from './components/all-reports/all-reports.component';
import { StoreModule } from '@ngrx/store';
import * as fromReport from './store/report.reducer';
import { EffectsModule } from '@ngrx/effects';
import { ReportEffects } from './store/report.effects';
import { ReportDetailsComponent } from './components/report-details/report-details.component';


@NgModule({
  declarations: [AllReportsComponent, ReportDetailsComponent],
  imports: [
    ThemeModule,
    ReportsRoutingModule,
    StoreModule.forFeature(fromReport.reportsFeatureKey, fromReport.reducer),
    EffectsModule.forFeature([ReportEffects])
  ]
})
export class ReportsModule { }
