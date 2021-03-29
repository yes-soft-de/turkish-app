import { createFeatureSelector, createSelector } from "@ngrx/store";
import { productsFeatureKey, ProductState, selectAll, selectEntities } from "./product.reducer";

// fetch the whole slice for product state
export const selectProductState = createFeatureSelector<ProductState>(productsFeatureKey);

export const productsSelector = createSelector(selectProductState, selectAll);

export const productSelector = createSelector(selectProductState, (state: ProductState) => state.selectedProduct);

export const getProductError = createSelector(selectProductState, (state: ProductState) => state.error);
