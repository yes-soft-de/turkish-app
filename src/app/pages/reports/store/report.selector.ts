import {createFeatureSelector, createSelector} from '@ngrx/store';
import {reportsFeatureKey, ReportState, selectAll} from './report.reducer';

const reportsFeatureState = createFeatureSelector<ReportState>(reportsFeatureKey);

// Reports Selector
export const reportsSelector = createSelector(reportsFeatureState, selectAll);

// Report Selector
export const reportSelector = createSelector(reportsFeatureState, (state: ReportState) => state.selectedReport);

export const getReportsError = createSelector(reportsFeatureState, (state: ReportState) => state.error);
