import { Component, OnDestroy, OnInit } from '@angular/core';
import {forkJoin, Observable, Subscription} from 'rxjs';
import { FooterComponent } from 'src/app/@theme/components';
import { Cars } from '../products/model/cars';
import { CarsResponse } from '../products/model/cars-response';
import { Devices } from '../products/model/devices';
import { RealEstate } from '../products/model/real-estate';
import { ReportsResponse } from '../reports/model/reports-response';
import { Reports } from '../reports/model/reports.model';
import {DashboardService} from './services/dashboard.service';
import {StatisticsResponse} from './model/statistics-response';
import {Statistic} from './model/statistic.model';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss'],
  providers: [FooterComponent]
})
export class DashboardComponent implements OnInit, OnDestroy {
  allCars: Cars[];
  allDevices: Devices[];
  allRealEstate: RealEstate[];
  allReports: Reports[];
  allStatistics: Statistic;

  latestCarsNumber = 5;
  latestDevicesNumber = 5;
  latestRealEstateNumber = 5;

  combinedObservable: Subscription;

  constructor(private dashboardService: DashboardService) {
  }

  ngOnInit() {

    const allCars: Observable<CarsResponse> = this.dashboardService.getAllCars();
    const allDevices: Observable<any> = this.dashboardService.getDevices();
    const allReports: Observable<ReportsResponse> = this.dashboardService.getReports();
    const allStatistics: Observable<any> = this.dashboardService.allStatistics();
    const mergeRequests: Observable<any> = forkJoin([allCars, allDevices, allReports, allStatistics]);

    mergeRequests.subscribe(
      response => {
        if (response) {
          console.log('response : ', response);
          this.allCars = response[0].Data;
          this.allDevices = response[1].Data;
          this.allReports = response[2].Data;
          this.allStatistics = response[3].Data[0];
        }
      }

    );
  }

  ngOnDestroy() {
    // this.combinedObservable.unsubscribe();
  }

}
