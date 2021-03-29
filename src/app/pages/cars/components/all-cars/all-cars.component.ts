import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { select, Store } from '@ngrx/store';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';
import { CarsService } from '../../services/cars.service';
import { CarState } from '../../store/car.reducer';
import * as carAction from '../../store/car.actions';
import * as carSelector from '../../store/car.selector';
import { Cars } from '../../model/cars';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-all-cars',
  templateUrl: './all-cars.component.html',
  styleUrls: ['./all-cars.component.scss'],
  providers: [DatePipe]
})
export class AllCarsComponent implements OnInit {
  uploadForm: FormGroup;
  cars: Cars[];
  carsList: Cars[] = [];
  carsFilterList: Cars[] = [];         // We Create It Second For Filter
  error$: Observable<string>;
  isDeleted = false;
  config: any;                                          // Config Variable For Pagination Configuration
  name: string;

  constructor(private datePipe: DatePipe,
              private store: Store<CarState>,
              private toaster: ToastrService) { }

  ngOnInit() {
    this.store.dispatch(carAction.loadCars());
    // Get All cars
    this.getCars();
    // Dispatch Error
    // this.store.pipe(carSelector.getProductError).subscribe(
    //   error => this.handleError(error)
    // );
  }

  // Get All cars
  getCars() {
    this.store.pipe(select(carSelector.carsSelector)).subscribe(
      (allCars: any) => {
        console.log('all Cars', allCars);
        this.cars = allCars;
        this.carsList = allCars;
        this.carsFilterList = this.carsList;
      }
    );
    this.config = {
      itemsPerPage: 5,
      currentPage: 1,
      totalItems: this.carsList.length
    };
  }

  // Handle Response Error
  handleError(error) {
    console.log(error);
    if (error.error.error) {
      this.toaster.error(error.error.error);
    } else if (error.error.msg) {
      this.toaster.error(error.error.msg);
    }
  }

  // Fetch The Page Number On Page Change
  pageChanged(event) {
    this.config.currentPage = event;
  }

  // Delete The Cars
  delete(carId: number) {
    if (confirm('Are You Sure You Want To Delete This Car')) {
      this.isDeleted = true;
      this.store.dispatch(carAction.deleteCar({id: carId}));
      this.toaster.success('Car Successfully Deleted');
      setTimeout(() => { this.isDeleted = false; }, 1000);      
    } else {
      return false;
    }
  }


  applyFilter() {
    // if the search input value is empty
    if (!this.name) {
      this.carsFilterList = [...this.carsList];
    } else {
      this.carsFilterList = [];
      this.carsFilterList = this.carsList.filter(res => {
        if (res.brand) {
          const brand = res.brand.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (brand) {
            // display the Name Column
            return brand;
          }
        }
        if (res.company) {
          const company = res.company.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (company) {
            // display the Name Column
            return company;
          }
        }
        if (res.carType) {
          const carType = res.carType.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (carType) {
            // display the Name Column
            return carType;
          }
        }
        if (res.country) {
          const country = res.country.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (country) {
            // display the Name Column
            return country;
          }
        }
        if (res.yearOfRelease) {
          const yearOfRelease = (this.datePipe.transform(new Date(res.yearOfRelease.timestamp * 1000), 'yyyy-MM-dd')).toString().match(this.name.toLocaleLowerCase());
          if (yearOfRelease) {
            // display the Name Column
            return yearOfRelease;
          }
        }
      });
    }
  }

}
