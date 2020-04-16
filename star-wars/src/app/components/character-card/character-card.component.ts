import { Component, OnInit, Input } from '@angular/core';
import { Character } from 'src/app/models/character.model';
import { ScreenHelper } from 'src/app/helpers/screen.helper';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-character-card',
  templateUrl: './character-card.component.html',
  styleUrls: ['./character-card.component.scss']
})
export class CharacterCardComponent implements OnInit {

  @Input()
  character: Character

  @Input()
  showDetail: boolean = false

  
  isSmall$: Observable<boolean>
  
  constructor(
    private screenHelperService : ScreenHelper
  ) {

    this.isSmall$ = this.screenHelperService.isSmall$
    
  }

  ngOnInit(): void {
  }

  routerLink() {
    if(!this.showDetail) {
      return this.character.id
    }

    return null
  }

}
