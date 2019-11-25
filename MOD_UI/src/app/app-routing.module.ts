import { NgModule, Component } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { Guard1Guard } from './shared/guard/guard1.guard';
import { Guard2Guard } from './shared/guard/guard2.guard';
import { Guard3Guard } from './shared/guard/guard3.guard';
import { Guard4Guard } from './shared/guard/guard4.guard';

export const routes: Routes = [

  { path: '', redirectTo:'home', pathMatch:'full'},
  { path: 'home', loadChildren:'src/app/home/home.module#HomeModule'},
  { path: 'user-register', loadChildren:'./user-register/user-register.module#UserRegisterModule'},
  { path: 'trainer-register', loadChildren:'./trainer-register/trainer-register.module#TrainerRegisterModule'},
  { path: 'login', loadChildren: './login/login.module#LoginModule'},
  { path: 'search-trainings', loadChildren: './search-trainings/search-trainings.module#getSearchDataModule'},
  { path: 'user-dashboard', loadChildren:'./user-dashboard/user-dashboard.module#UserDashboardModule'},
  { path: 'trainer-dashboard', loadChildren:'./trainer-dashboard/trainer-dashboard.module#TrainerDashboardModule'},
  { path: 'admin-dashboard', loadChildren:'./admin-dashboard/admin-dashboard.module#AdminDashboardModule'},
  { path: 'not-found', loadChildren: './not-found/not-found.module#NotFoundModule'}
  
];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
