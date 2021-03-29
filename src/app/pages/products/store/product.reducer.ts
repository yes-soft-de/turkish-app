import { Action, createReducer, MetaReducer, on } from '@ngrx/store';
import { EntityState, EntityAdapter, createEntityAdapter } from '@ngrx/entity';
import { environment } from 'src/environments/environment';
import { Products } from '../model/products';
import { ProductDetails } from '../model/product-details';
import * as ProductAction from '../store/product.actions';

export const productsFeatureKey = 'products';

export interface ProductState extends EntityState<Products> {
  // additional entities state properties
  Data: Products[];
  selectedProduct: ProductDetails;
  error: any;
}

export const adapter: EntityAdapter<Products> = createEntityAdapter<Products>();

export const initialState: ProductState = adapter.getInitialState({
  // additional entity state properties
  Data: undefined,
  selectedProduct: undefined,
  error: undefined
});


export const reducer = createReducer(
  initialState,

  on(ProductAction.loadProductsSuccess,
    (state, action) => adapter.setAll(action.Data, state)
  ),
  on(ProductAction.loadProductsFailure,
    (state, action) => {
      return {
        ...state,
        error: action.error
      };
    }
  ),
  on(ProductAction.deleteProductSuccess,
    (state, action) => adapter.removeOne(action.id, state)
  ),
  on(ProductAction.deleteProductFailure,
    (state, action) => {
      return {
        ...state,
        error: action.error
      };
    }
  ),
  // on(ProductAction.loadAdminSuccess,
  //   (state, action) => {
  //     return {
  //       ...state,
  //       selectedAdmin: action.data
  //     }
  //   }
  // ),
  // on(ProductAction.loadAdminFailure,
  //   (state, action) => {
  //     return {
  //       ...state,
  //       error: action.error
  //     }
  //   }
  // ),
  // on(ProductAction.addAdminSuccess,
  //   (state, action) => adapter.addOne(action.admin, state)
  // ),
  // on(ProductAction.addAdminFailure,
  //   (state, action) => {
  //     return {
  //       ...state,
  //       error: action.error
  //     }
  //   }
  // ),
  // on(ProductAction.deleteAdminSuccess,
  //   (state, action) => adapter.removeOne(action.id, state)
  // ),
  // on(ProductAction.deleteAdminFailure,
  //   (state, action) => {
  //     return {
  //       ...state,
  //       error: action.error
  //     }
  // }),
  // on(ProductAction.updateAdmin,
  //   (state, action) => adapter.updateOne(action.admin, state)
  // ),
  // on(ProductAction.updateAdminFailure,
  //   (state, action) => {
  //     return {
  //       ...state,
  //       error: action.error
  //     }
  // }),

  // on(ProductAction.upsertAdmin,
  //   (state, action) => adapter.upsertOne(action.admin, state)
  // ),
  // on(ProductAction.upsertAdmins,
  //   (state, action) => adapter.upsertMany(action.admins, state)
  // ),
  // on(ProductAction.updateAdmins,
  //   (state, action) => adapter.updateMany(action.admins, state)
  // ),
  // on(ProductAction.deleteAdmin,
  //   (state, action) => adapter.removeOne(action.id, state)
  // ),
  // on(ProductAction.deleteAdmins,
  //   (state, action) => adapter.removeMany(action.ids, state)
  // ),
  // on(ProductAction.clearAdmins,
  //   state => adapter.removeAll(state)
  // ),
);

export const metaReducers: MetaReducer<ProductState>[] = !environment.production ? [] : [];

export const {
  selectIds,
  selectEntities,
  selectAll,
  selectTotal,
} = adapter.getSelectors();
