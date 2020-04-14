import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CharactersListComponent } from './pages/characters-list/characters-list.component';
import { CharactersItemComponent } from './pages/characters-item/characters-item.component';


const routes: Routes = [
  {
    path: '',
    component: CharactersListComponent
  },
  {
    path: ':id',
    component: CharactersItemComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
