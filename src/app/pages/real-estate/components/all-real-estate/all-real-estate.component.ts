import { Component, OnInit } from '@angular/core';
import { select, Store } from '@ngrx/store';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';
import { RealEstateService } from '../../services/real-estate.service';
import { RealEstateState } from '../../store/real-estate.reducer';
import * as realEstateAction from '../../store/real-estate.actions';
import * as realEstateSelector from '../../store/real-estate.selector';
import { RealEstate } from '../../model/real-estate.model';

@Component({
  selector: 'app-all-real-estate',
  templateUrl: './all-real-estate.component.html',
  styleUrls: ['./all-real-estate.component.scss']
})
export class AllRealEstateComponent implements OnInit {
  realEstates: RealEstate[];
  realEstatesList: RealEstate[] = [];
  realEstatesFilterList: RealEstate[] = [];         // We Create It Second For Filter
  error$: Observable<string>;
  isDeleted = false;
  config: any;                                          // Config Variable For Pagination Configuration
  name: string;

  constructor(private store: Store<RealEstateState>,
              private toaster: ToastrService) { }

  ngOnInit() {
    this.store.dispatch(realEstateAction.loadRealEstates());
    // Get All realEstates
    this.getRealEstates();
    // Dispatch Error
    this.store.pipe(select(realEstateSelector.getRealEstateError)).subscribe(
      error => this.handleError(error)
    );
  }

  // Get All realEstates
  getRealEstates() {
    this.store.pipe(select(realEstateSelector.realEstatesSelector)).subscribe(
      (allrealEstates: any) => {
        console.log('all realEstates', allrealEstates);
        this.realEstates = allrealEstates;
        this.realEstatesList = allrealEstates;
        this.realEstatesFilterList = this.realEstatesList;
      }
    );
    this.config = {
      itemsPerPage: 5,
      currentPage: 1,
      totalItems: this.realEstatesList.length
    };
  }

  // Handle Response Error
  handleError(error) {
    console.log('error', error);
    if (error) {
      if (error.error.error) {
        this.toaster.error(error.error.error);
      }
      if (error.error.msg) {
        this.toaster.error(error.error.msg);
      } else {
        this.toaster.error('Server Error');
      }
    }
  }

  // Fetch The Page Number On Page Change
  pageChanged(event) {
    this.config.currentPage = event;
  }

  // Delete The Realestate
  delete(realEstateId: number) {
    if (confirm('Are You Sure You Want To Delete This RealEstate')) {
      this.isDeleted = true;
      this.store.dispatch(realEstateAction.deleteRealEstate({id: realEstateId}));
      this.toaster.success('RealEstate Successfully Deleted');
      setTimeout(() => { this.isDeleted = true; }, 1000);
    } else {
      return false;
    }
  }


  applyFilter() {
    // if the search input value is empty
    if (!this.name) {
      this.realEstatesFilterList = [...this.realEstatesList];
    } else {
      this.realEstatesFilterList = [];
      this.realEstatesFilterList = this.realEstatesList.filter(res => {
        if (res.userName) {
          const userName = res.userName.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (userName) {
            // display the Name Column
            return userName;
          }
        }
        if (res.country) {
          const country = res.country.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (country) {
            // display the Name Column
            return country;
          }
        }
        if (res.city) {
          const city = res.city.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (city) {
            // display the Name Column
            return city;
          }
        }
        if (res.company) {
          const company = res.company.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (company) {
            // display the Name Column
            return company;
          }
        }
        if (res.realEstateType) {
          const realEstateType = res.realEstateType.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (realEstateType) {
            // display the Name Column
            return realEstateType;
          }
        }
      });
    }
  }

}
