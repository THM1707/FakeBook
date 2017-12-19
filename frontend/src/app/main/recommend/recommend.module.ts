import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {RecommendComponent} from './recommend.component';
import {RouterModule, Routes} from '@angular/router';


const routes: Routes = [
  {path: '', component: RecommendComponent}
];


@NgModule({
  imports: [
    CommonModule,
    RouterModule.forChild(routes)
  ],
  declarations: [RecommendComponent]
})
export class RecommendModule {
}
