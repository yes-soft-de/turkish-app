import { NgModule } from '@angular/core';
import { ThemeModule } from 'src/app/@theme/theme.module';

import { ProductsRoutingModule } from './products-routing.module';
import { EffectsModule } from '@ngrx/effects';
import * as fromProduct from './store/product.reducer';
import { ProductEffects } from './store/product.effects';
import { AllProductsComponent } from './components/all-products/all-products.component';
import { ProductDetailsComponent } from './components/product-details/product-details.component';
import { StoreModule } from '@ngrx/store';


@NgModule({
  declarations: [AllProductsComponent, ProductDetailsComponent],
  imports: [
    ThemeModule,
    ProductsRoutingModule,
    StoreModule.forFeature(fromProduct.productsFeatureKey, fromProduct.reducer),
    EffectsModule.forFeature([ProductEffects])
  ]
})
export class ProductsModule { }
