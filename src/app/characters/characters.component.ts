import { Component, OnInit } from '@angular/core';
import { RequestsService } from '../services/requests.service';

@Component({
  selector: 'app-characters',
  templateUrl: './characters.component.html',
  styleUrls: ['./characters.component.scss']
})
export class CharactersComponent implements OnInit {

  characters: any;
  page = 0;
  characterSelected = null;

  constructor(private request: RequestsService) {}

  ngOnInit() {
    this.getCharacters();
  }

  getCharacters() {
    this.page++;
    this.request.doGet(`people/?page=${this.page}`).subscribe(data => {
      this.page === 1 ? this.characters = data : this.characters.results = this.characters.results.concat(data.results);
      console.log(this.characters);
    });
  }

  selectCharacter(character) {
    this.characterSelected = character;
  }

}
