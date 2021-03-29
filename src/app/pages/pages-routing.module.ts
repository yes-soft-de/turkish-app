import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { NotFoundComponent } from '../@theme/components';
import { AfterLoginService } from './admin-service/guard/after-login.service';
import { BeforeLoginService } from './admin-service/guard/before-login.service';
import { PagesComponent } from './pages.component';


const routes: Routes = [
  {
    path: '',
    component: PagesComponent,
    children: [
      {
        path: '',
        loadChildren: () => import('./dashboard/dashboard.module').then(m => m.DashboardModule),
        canActivate: [AfterLoginService]
      },
      {
        path: 'products',
        loadChildren: () => import('./products/products.module').then(m => m.ProductsModule),
        canActivate: [AfterLoginService]
      },
      {
        path: 'cars',
        loadChildren: () => import('./cars/cars.module').then(m => m.CarsModule),
        canActivate: [AfterLoginService]
      },
      {
        path: 'devices',
        loadChildren: () => import('./devices/devices.module').then(m => m.DevicesModule),
        canActivate: [AfterLoginService]
      },
      {
        path: 'real-estate',
        loadChildren: () => import('./real-estate/real-estate.module').then(m => m.RealEstateModule),
        canActivate: [AfterLoginService]
      },
      {
        path: 'reports',
        loadChildren: () => import('./reports/reports.module').then(m => m.ReportsModule),
        canActivate: [AfterLoginService]
      },
      {
        path: 'chats',
        loadChildren: () => import('./chats/chats.module').then(m => m.ChatsModule),
        canActivate: [AfterLoginService]
      },
      { path: '**', component: NotFoundComponent }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PagesRoutingModule { }
