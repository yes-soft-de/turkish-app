import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ProductDetails } from '../../model/product-details';
import { ProductDetailsResponse } from '../../model/product-details-response';
import { Products } from '../../model/products';
import { ProductsService } from '../../services/products.service';

@Component({
  selector: 'app-product-details',
  templateUrl: './product-details.component.html',
  styleUrls: ['./product-details.component.scss']
})
export class ProductDetailsComponent implements OnInit {
  productDetails: ProductDetails;

  constructor(private productService: ProductsService,
              private activatedRoute: ActivatedRoute) { }

  ngOnInit(): void {
    // this.productService.getProductDetails(this.activatedRoute.snapshot.params.get('id'))
    // .subscribe(
    //   (response: ProductDetailsResponse) => this.responseHandler(response),
    //   error => this.errorHandler(error)
    // );
  }

  responseHandler(response) {
    this.productDetails = response.Data;
  }

  errorHandler(error) {

  }

}
