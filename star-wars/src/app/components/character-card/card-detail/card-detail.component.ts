import { Component, OnInit, Input, OnChanges } from '@angular/core';
import { Character } from 'src/app/models/character.model';


class Item {
  icon: string
  type: string
  text: string | number
}

@Component({
  selector: 'app-character-card-detail',
  templateUrl: './card-detail.component.html',
  styleUrls: ['./card-detail.component.scss']
})
export class CardDetailComponent implements OnInit, OnChanges {

  @Input()
  character: Character
  
  @Input()
  smallScreen: boolean

  itens1: Item[]
  itens2: Item[]

  constructor() { }

  ngOnInit(): void {
  }

  ngOnChanges() {

    this.itens1 = [
      {
        icon: 'calendar_today',
        type: 'Birth Year',
        text: this.character.birthYear
      },
      {
        icon: 'visibility',
        type: 'Eye Color',
        text: this.character.eyeColor
      },
      {
        icon: 'supervisor_account',
        type: 'Gender',
        text: this.character.gender
      },
      {
        icon: 'face',
        type: 'Hair Color',
        text: this.character.hairColor
      },
    ]

    this.itens2 = [
      {
        icon: 'height',
        type: 'Height',
        text: this.character.height
      },
      {
        icon: 'person',
        type: 'Mass',
        text: this.character.mass
      },
      {
        icon: 'color_lens',
        type: 'Skil Color',
        text: this.character.skinColor
      },
      {
        icon: 'home',
        type: 'Home',
        text: this.character.homeworld
      }
    ]

  }

}
