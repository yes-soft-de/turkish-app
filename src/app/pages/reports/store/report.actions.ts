import { createAction, props } from '@ngrx/store';
import { Update } from '@ngrx/entity';

import { Reports } from '../model/reports.model';
import {ReportDetails} from '../model/report-details';

export const loadReports = createAction(
  '[Report/API] Load Reports',
);

export const loadReportsSuccess = createAction(
  '[Report/API] Leoad Reports Success',
  props<{ Data: Reports[]}>()
);

export const loadReportsFailure = createAction(
  '[Report/API] Load Reports Failure',
  props<{ error: string }>()
);

export const loadReport = createAction(
  '[Report Components/API] Load Report',
  props<{ id: number }>()
);

export const loadReportSuccess = createAction(
  '[Report Effect/API] Load Report Success',
  props<{ Data: ReportDetails }>()
);

export const loadReportFailure = createAction(
  '[Report Effect/API] Load Report Failure',
  props<{ error: string }>()
);

export const deleteReport = createAction(
  '[Report Component/API] Delete Report',
  props<{ id: string }>()
);

export const deleteReportSuccess = createAction(
  '[Report Effect/API] Delete Report Success',
  props<{ id: string }>()
);

export const deleteReportFailure = createAction(
  '[Report Effect/API] Delete Report Failure',
  props<{ error: string }>()
);

