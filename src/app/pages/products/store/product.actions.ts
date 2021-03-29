import { createAction, props } from '@ngrx/store';
import { Update } from '@ngrx/entity';
import { Products } from '../model/products';
import { Cars } from '../model/cars';



export const loadProducts = createAction(
  '[Product/API] Load Products'
);

export const loadProductsSuccess = createAction(
  '[Product/API] Load Products Success',
  props<{ Data: Products[] }>()
);

export const loadProductsFailure = createAction(
  '[Product/API] Load Products Failure',
  props<{ error: string }>()
);

export const deleteProduct = createAction(
  '[Product Component/API] Delete Product',
  props<{ id: string }>()
);

export const deleteProductSuccess = createAction(
  '[Product Effect/API] Delete Product Success',
  props<{ id: string }>()
);

export const deleteProductFailure = createAction(
  '[Product Effect/API] Delete Product Failure',
  props<{ error: string }>()
);

// export const loadAdmin = createAction(
//   '[Admin Component/API] Load Admin',
//   props<{ id: number }>()
// );

// export const loadAdminSuccess = createAction(
//   '[Admin Effects/API] Load Admin Success',
//   props<{ data: Admin }>()
// );

// export const loadAdminFailure = createAction(
//   '[Admin Effects/API] Load Admin Failure',
//   props<{ error: string }>()
// );

// export const addAdmin = createAction(
//   '[Admin Components/API] Add Admin',
//   props<{ admin: Admin }>()
// );

// export const addAdminSuccess = createAction(
//   '[Admin Effects/API] Add Admin Success',
//   props<{ admin: Admin }>()
// );

// export const addAdminFailure = createAction(
//   '[Admin Effects/API] Add Admin Failure',
//   props<{ error: any }>()
// );

// export const deleteAdmin = createAction(
//   '[Admin Component/API] Delete Admin',
//   props<{ id: string }>()
// );

// export const deleteAdminSuccess = createAction(
//   '[Admin Effects/API] Delete Admin Success',
//   props<{ id: string }>()
// );

// export const deleteAdminFailure = createAction(
//   '[Admin Effects/API] Delete Admin Failure',
//   props<{ error: string }>()
// );

// export const updateAdmin = createAction(
//   '[Admin Components/API] Update Admin',
//   props<{ admin: Update<Admin> }>()
// );

// export const updateAdminSuccess = createAction(
//   '[Admin Effects/API] Update Admin Success',
//   props<{ admin: Update<Admin> }>()
// );

// export const updateAdminFailure = createAction(
//   '[Admin Effects/API] Update Admin Failure',
//   props<{ error: string }>()
// );




// export const upsertAdmin = createAction(
//   '[Admin/API] Upsert Admin',
//   props<{ admin: Admin }>()
// );

// export const upsertAdmins = createAction(
//   '[Admin/API] Upsert Admins',
//   props<{ admins: Admin[] }>()
// );

// export const updateAdmins = createAction(
//   '[Admin/API] Update Admins',
//   props<{ admins: Update<Admin>[] }>()
// );

// export const clearAdmins = createAction(
//   '[Admin/API] Clear Admins'
// );
