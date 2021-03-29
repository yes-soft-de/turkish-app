import {Component, HostListener, Inject, OnInit, Renderer2} from '@angular/core';
import {CarState} from '../../store/car.reducer';
import {select, Store} from '@ngrx/store';
import {ActivatedRoute, Router} from '@angular/router';
import * as carAction from '../../store/car.actions';
import * as carSelector from '../../store/car.selector';
import {CarsService} from '../../services/cars.service';
import {Cars} from '../../model/cars';
import {Observable} from 'rxjs';
import {Car} from '../../model/car-model';
import {DOCUMENT} from '@angular/common';
import {main} from '@angular/compiler-cli/src/main';

@Component({
  selector: 'app-car-details',
  templateUrl: './car-details.component.html',
  styleUrls: ['./car-details.component.scss']
})
export class CarDetailsComponent implements OnInit {
  carDetails: Car;
  rendering = false;
  imagesRendering = false;

  constructor(private store: Store<CarState>,
              private carsService: CarsService,
              private router: Router,
              private activatedRoute: ActivatedRoute,
              @Inject(DOCUMENT) private document: Document,
              private render: Renderer2) { }

  ngOnInit(): void {
    const carID = Number(this.activatedRoute.snapshot.paramMap.get('id'));
    this.store.dispatch(carAction.loadCar({id: carID}));
    this.getCarDetails();
  }

  // Get Car Details
  getCarDetails() {
    this.store.pipe(select(carSelector.carSelector)).subscribe(
      data => {
        console.log(data);
        this.carDetails = data;
      }
    );
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
    if ((customId + 1) == this.carDetails.images.length) {
      // Check If the main image is rendering finish
      if (!this.render) {
        console.log('rendering all image');
        this.imagesRendering = false;
      }
    }
  }



}
