import { Component, OnInit } from '@angular/core';
import { select, Store } from '@ngrx/store';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';
import { DevicesService } from '../../services/devices.service';
import { DeviceState } from '../../store/device.reducer';
import * as deviceAction from '../../store/device.actions';
import * as deviceSelector from '../../store/device.selector';
import { Device } from '../../model/device';

@Component({
  selector: 'app-all-devices',
  templateUrl: './all-devices.component.html',
  styleUrls: ['./all-devices.component.scss']
})
export class AllDevicesComponent implements OnInit {
  devices: Device[];
  devicesList: Device[] = [];
  devicesFilterList: Device[] = [];                     // We Create It Second For Filter
  error$: Observable<string>;
  isDeleted = false;
  config: any;                                          // Config Variable For Pagination Configuration
  name: string;

  constructor(private store: Store<DeviceState>,
              private toaster: ToastrService) { }

  ngOnInit() {
    this.store.dispatch(deviceAction.loadDevices());
    // Get All devices
    this.getDevices();
    // Dispatch Error
    this.store.pipe(select(deviceSelector.getDevicesError)).subscribe(
      error => console.log('error', error)
    );
  }

  // Get All devices
  getDevices() {
    this.store.pipe(select(deviceSelector.allDevicesSelector)).subscribe(
      (alldevices: any) => {
        console.log('all devices', alldevices);
        this.devices = alldevices;
        this.devicesList = alldevices;
        this.devicesFilterList = this.devicesList;
        this.isDeleted = false;
      }
    );
    this.config = {
      itemsPerPage: 5,
      currentPage: 1,
      totalItems: this.devicesList.length
    };
  }

  // Handle Response Error
  handleError(error) {
    console.log('error : ', error);
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

  // Delete The Device
  delete(deviceId: number) {
    if (confirm('Are You Sure You Want To Delete This Device')) {
      this.isDeleted = true;
      this.store.dispatch(deviceAction.deleteDevice({id: deviceId}));
      this.toaster.success('Device Successfully Deleted');
      setTimeout(() => { this.isDeleted = false; }, 1000);
    } else {
      return false;
    }
  }


  applyFilter() {
    // if the search input value is empty
    if (!this.name) {
      this.devicesFilterList = [...this.devicesList];
    } else {
      this.devicesFilterList = [];
      this.devicesFilterList = this.devicesList.filter(res => {
        if (res.userName) {
          const username = res.userName.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (username) {
            // display the Name Column
            return username;
          }
        }
        if (res.brand) {
          const brand = res.brand.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (brand) {
            // display the Name Column
            return brand;
          }
        }
        if (res.cpu) {
          const cpu = res.cpu.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (cpu) {
            // display the Name Column
            return cpu;
          }
        }
        if (res.price) {
          const price = res.price.toString().toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (price) {
            // display the Name Column
            return price;
          }
        }
        if (res.type) {
          const type = res.type.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (type) {
            // display the Name Column
            return type;
          }
        }
      });
    }
  }

}
