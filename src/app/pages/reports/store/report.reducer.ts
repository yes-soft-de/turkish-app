import { Action, createReducer, on } from '@ngrx/store';
import { EntityState, EntityAdapter, createEntityAdapter } from '@ngrx/entity';
import * as ReportActions from './report.actions';
import {Reports} from '../model/reports.model';
import {ReportDetails} from '../model/report-details';

export const reportsFeatureKey = 'reports';

export interface ReportState extends EntityState<Reports> {
  // additional entities state properties
  Data: Reports[];
  selectedReport: ReportDetails;
  error: string;
}

export const adapter: EntityAdapter<Reports> = createEntityAdapter<Reports>();

export const initialState: ReportState = adapter.getInitialState({
  // additional entity state properties
  Data: undefined,
  selectedReport: undefined,
  error: undefined
});


export const reducer = createReducer(
  initialState,
  on(ReportActions.loadReportsSuccess,
    (state, action) => adapter.setAll(action.Data, state)
  ),
  on(ReportActions.loadReportsFailure,
    (state, action) => {
      return {
        ...state,
        error: action.error
      };
    }
  ),
  on(ReportActions.loadReportSuccess,
    (state, action) => {
      return {
        ...state,
        selectedReport: action.Data
      };
    }
  ),
  on(ReportActions.loadReportFailure,
    (state, action) => {
      return {
        ...state,
        error: action.error
      };
    }
  ),
  on(ReportActions.deleteReportSuccess,
    (state, action) => adapter.removeOne(action.id, state)
  ),
  on(ReportActions.deleteReportFailure,
    (state, action) => {
      return {
        ...state,
        error: action.error
      };
    }
  ),
);


export const {
  selectIds,
  selectEntities,
  selectAll,
  selectTotal,
} = adapter.getSelectors();
