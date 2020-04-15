import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { CharactersListComponent } from './pages/characters-list/characters-list.component';
import { CharactersItemComponent } from './pages/characters-item/characters-item.component';
import { LayoutModule } from '@angular/cdk/layout';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatButtonModule } from '@angular/material/button';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatIconModule } from '@angular/material/icon';
import { MatListModule } from '@angular/material/list';
import { MatProgressBarModule } from '@angular/material/progress-bar'
import { HttpClientModule } from '@angular/common/http';
import { CharacterCardComponent } from './components/character-card/character-card.component';
import { CharactersGridComponent } from './components/characters-grid/characters-grid.component';

@NgModule({
  declarations: [
    AppComponent,
    CharactersListComponent,
    CharactersItemComponent,

    CharacterCardComponent,
    CharactersGridComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    LayoutModule,
    MatToolbarModule,
    MatButtonModule,
    MatSidenavModule,
    MatIconModule,
    MatListModule,
    MatProgressBarModule,

    HttpClientModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
