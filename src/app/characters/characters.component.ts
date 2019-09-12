import { Component, OnInit } from '@angular/core';
import { RequestsService } from '../services/requests.service';
import { Results } from '../services/results'

@Component({
  selector: 'app-characters',
  templateUrl: './characters.component.html',
  styleUrls: ['./characters.component.scss']
})
export class CharactersComponent implements OnInit {

  characters: Results;
  species: Results;
  page = 0;
  characterSelected = null;

  constructor(private request: RequestsService) {}

  ngOnInit() {
    this.getCharacters();
    // this.getSpecies();
  }

  getIdFromUrl(url){
    return url.match(/([0-9])+/g)[0];
  };

  getCharacters() {
      this.page++;
      this.request.doGet(`people/?page=${this.page}`).subscribe(data => {
        this.page === 1 ? this.characters = data : this.characters.results = this.characters.results.concat(data.results);
        console.log(this.characters);
      });
  }

  getSpecies() {
    this.request.doGet(`species/`).subscribe(data => {
      this.species = data;
    });
}

  imageUrl(id){
    return `../../assets/images/characters/${id}.jpg`;
  }

  selectCharacter(character) {
    this.characterSelected = character;
  }

  close() {
    this.characterSelected = null;
  }

}
