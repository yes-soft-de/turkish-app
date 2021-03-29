import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { select, Store } from '@ngrx/store';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';
import { Products } from '../../model/products';
import { ProductsService } from '../../services/products.service';
import { ProductState } from '../../store/product.reducer';
import * as productAction from '../../store/product.actions';
import * as productSelector from '../../store/product.selector';

@Component({
  selector: 'app-all-products',
  templateUrl: './all-products.component.html',
  styleUrls: ['./all-products.component.scss']
})
export class AllProductsComponent implements OnInit {
  uploadForm: FormGroup;
  products: Products[];
  productsList: Products[] = [];
  productsFilterList: Products[] = [];                  // We Create It Second For Filter
  error$: Observable<string>;
  isDeleted = false;
  config: any;                                          // Config Variable For Pagination Configuration
  name: string;

  constructor(private productService: ProductsService,
              private formBuilder: FormBuilder,
              private store: Store<ProductState>,
              private toaster: ToastrService) { }

  ngOnInit() {
    this.store.dispatch(productAction.loadProducts());
    // Get All Products
    this.getProducts();
    // Dispatch Error
    this.store.pipe(select(productSelector.getProductError)).subscribe(
      error => this.handleError(error)
    );
  }

  // Get All Products
  getProducts() {
    this.store.pipe(select(productSelector.productsSelector)).subscribe(
      (allProducts: any) => {
        console.log('all Products', allProducts);
        this.products = allProducts;
        this.productsList = allProducts;
        this.productsFilterList = this.productsList;
      }
    );
    this.config = {
      itemsPerPage: 5,
      currentPage: 1,
      totalItems: this.productsList.length
    };
  }

  // Handle Response Error
  handleError(error) {
    console.log('error : ', error);
    if (error) {
      if (error.error.error) {
        this.toaster.error(error.error.error);
      } else if (error.error.msg) {
        this.toaster.error(error.error.msg);
      }
    }
  }

  // Fetch The Page Number On Page Change
  pageChanged(event) {
    this.config.currentPage = event;
  }

  // Delete The Category
  delete(productId: string) {
    if (confirm('Are You Sure You Want To Delete This Product')) {
      this.isDeleted = true;
      this.store.dispatch(productAction.deleteProduct({id: productId}));
      this.toaster.success('Product Successfully Deleted');
      // fetch all product after delete product
      this.getProducts();
    } else {
      return false;
    }
  }


  applyFilter() {
    // if the search input value is empty
    if (!this.name) {
      this.productsFilterList = [...this.productsList];
    } else {
      this.productsFilterList = [];
      this.productsFilterList = this.productsList.filter(res => {
        if (res.userName) {
          const userName = res.userName.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (userName) {
            // display the Name Column
            return userName;
          }
        }
        if (res.entity) {
          const entity = res.entity.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (entity) {
            // display the Name Column
            return entity;
          }
        }
        if (res.country) {
          const country = res.country.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (country) {
            // display the Name Column
            return country;
          }
        }
        if (res.status) {
          const status = res.status.toLocaleLowerCase().match(this.name.toLocaleLowerCase());
          if (status) {
            // display the Name Column
            return status;
          }
        }
      });
    }
  }

}
