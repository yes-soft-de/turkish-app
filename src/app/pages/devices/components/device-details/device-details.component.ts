import {Component, Inject, OnInit, Renderer2} from '@angular/core';
import {select, Store} from '@ngrx/store';
import {DeviceState} from '../../store/device.reducer';
import {ActivatedRoute} from '@angular/router';
import * as deviceAction from '../../store/device.actions';
import { deviceDetailsSelector } from '../../store/device.selector';
import {DeviceDetails} from '../../model/device-details';
import {DOCUMENT} from '@angular/common';

@Component({
  selector: 'app-device-details',
  templateUrl: './device-details.component.html',
  styleUrls: ['./device-details.component.scss']
})
export class DeviceDetailsComponent implements OnInit {
  device: DeviceDetails;
  rendering = false;
  imagesRendering = false;

  constructor(private store: Store<DeviceState>,
              private activatedRoute: ActivatedRoute,
              @Inject(DOCUMENT) private document: Document,
              private render: Renderer2) { }

  ngOnInit(): void {
    const deviceID = Number(this.activatedRoute.snapshot.paramMap.get('id'));
    this.store.dispatch(deviceAction.loadDevice({ id: deviceID }));
    this.deviceDetails();
  }

  // Get Device Details
  deviceDetails() {
    this.store.pipe(select(deviceDetailsSelector)).subscribe(data => {
      this.device = data;
      console.log(data);
    });
  }

  viewImage(element: HTMLDivElement) {
    const mainImage = this.document.querySelector('.image-details img');
    const mainImageLink = mainImage.getAttribute('src');
    const currentImage = element.firstChild as HTMLImageElement;
    const currentImageLink = currentImage.getAttribute('src');
    // force user to click on the same image for one time
    // if (mainImageLink != currentImageLink) {
    this.rendering = true;
    this.imagesRendering = true;
    this.render.setAttribute(currentImage, 'src', mainImageLink);
    this.render.setAttribute(mainImage, 'src', currentImageLink);
    // }
  }

  // Check If main image is rendering
  checkImageloaded()  {
    console.log('main Image rendered');
    this.rendering = false;
  }

  // Check if all second images is rendering
  checkSecondImagesloaded(customId: number) {
    // check if last second image is rendering finished
    if ((customId + 1) == this.device.images.length) {
      // Check If the main image is rendering finish
      if (!this.render) {
        console.log('rendering all image');
        this.imagesRendering = false;
      }
    }
  }
}
