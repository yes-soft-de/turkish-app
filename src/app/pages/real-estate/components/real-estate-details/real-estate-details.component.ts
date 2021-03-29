import {Component, Inject, OnInit, Renderer2} from '@angular/core';
import {RealEstateState} from '../../store/real-estate.reducer';
import {select, Store} from '@ngrx/store';
import {ActivatedRoute} from '@angular/router';
import * as realEstateAction from '../../store/real-estate.actions';
import {realEstateSelector} from '../../store/real-estate.selector';
import {RealEstateDetails} from '../../model/real-estate-details';
import {DOCUMENT} from '@angular/common';

@Component({
  selector: 'app-real-estate-details',
  templateUrl: './real-estate-details.component.html',
  styleUrls: ['./real-estate-details.component.scss']
})
export class RealEstateDetailsComponent implements OnInit {
  realEstate: RealEstateDetails;
  rendering = false;
  imagesRendering = false;

  constructor(private store: Store<RealEstateState>,
              private activatedRoute: ActivatedRoute,
              @Inject(DOCUMENT) private document: Document,
              private render: Renderer2) { }

  ngOnInit(): void {
    const realEstateID = Number(this.activatedRoute.snapshot.paramMap.get('id'));
    this.store.dispatch(realEstateAction.loadRealEstate({ id: realEstateID }));
    this.getRealEstateDetails();
  }

  getRealEstateDetails() {
    this.store.pipe(select(realEstateSelector)).subscribe(data => {
      console.log(data);
      this.realEstate = data;
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
    if ((customId + 1) == this.realEstate.images.length) {
      // Check If the main image is rendering finish
      if (!this.render) {
        console.log('rendering all image');
        this.imagesRendering = false;
      }
    }
  }

}
