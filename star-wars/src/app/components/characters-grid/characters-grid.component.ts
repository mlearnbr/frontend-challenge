import { Component, OnInit, Input } from '@angular/core';
import { Character } from 'src/app/models/character.model';
import { ScreenHelper } from 'src/app/helpers/screen.helper';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-characters-grid',
  templateUrl: './characters-grid.component.html',
  styleUrls: ['./characters-grid.component.scss']
})
export class CharactersGridComponent implements OnInit {

  @Input()
  characters: Character[]
  
  isHandset$ : Observable<boolean>
  isMedium$: Observable<boolean>
  isSmall$: Observable<boolean>
  
  
  constructor(
    private screenHelperService : ScreenHelper
  ) {

    this.isHandset$ = this.screenHelperService.isHandset$
    this.isMedium$ = this.screenHelperService.isMedium$
    this.isSmall$ = this.screenHelperService.isSmall$

  }

  ngOnInit(): void {
  }

}
