import { Injectable } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Actions, createEffect, ofType } from '@ngrx/effects';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';
import { catchError, concatMap, map, mergeMap, tap } from 'rxjs/operators';
import { ProductsService } from '../services/products.service';
import * as productActions from '../store/product.actions';


@Injectable()
export class ProductEffects {

  constructor(private actions$: Actions,
              private productService: ProductsService,
              private router: Router,
              private toaster: ToastrService,
              private activatedRoute: ActivatedRoute) {}

  // Load Products Effect
  loadProducts$ = createEffect(() => this.actions$.pipe(
    ofType(productActions.loadProducts),
    mergeMap(() => this.productService.getProducts()
      .pipe(
        map(productsResponse => productActions.loadProductsSuccess(productsResponse)),
        catchError(error => of(productActions.loadProductsFailure(error)))
      )
    )
  ));

  // loadAdmin$ = createEffect(() => this.actions$.pipe(
  //   ofType(productActions.loadAdmin),
  //   mergeMap(action => this.adminService.getAdmin(action.id)
  //     .pipe(
  //       map(admin => productActions.loadAdminSuccess(admin)),
  //       catchError(error => of(productActions.loadAdminFailure(error)))
  //     ))
  // ));

  // Delete Product Effect
  // deleteProduct$ = createEffect(() => this.actions$.pipe(
  //   ofType(productActions.deleteProduct),
  //   mergeMap(action => this.productService.deleteProduct(action.id)
  //     .pipe(
  //       map(response => productActions.deleteProductSuccess(response)),
  //       catchError(error => of(productActions.deleteProductFailure(error)))
  //     )
  //   )
  // ));


}
