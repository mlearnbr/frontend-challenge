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
  species: any;
  planets: any;
  films: any[];
  page = 0;
  characterSelected = null;

  constructor(private request: RequestsService) {}

  ngOnInit() {
    this.getCharacters();
  }

  getIdFromUrl(url){
    return url.match(/([0-9])+/g)[0];
  }

  imageUrl(id){
    return `../../assets/images/characters/${id}.jpg`;
  }

  getCharacters() {
    this.page++;
    this.request.doGet(`people/?page=${this.page}`).subscribe(data => {
      this.page === 1 ? this.characters = data : this.characters.results = this.characters.results.concat(data.results);
    });
  }

  getSpecies(urlSpecies) {
    this.request.doGet(`species/${this.getIdFromUrl(urlSpecies)}/`).subscribe(data => {
      this.species = data;
    });
  }

  getPlanets(urlHomeworld) {
    this.request.doGet(`planets/${this.getIdFromUrl(urlHomeworld)}/`).subscribe(data => {
      this.planets = data;
    });
  }

  getFilms(films) {
    this.films = [];
    films.forEach(film => {
       this.request.doGet(`films/${this.getIdFromUrl(film)}/`).subscribe(data => {
        this.films.push(data);
      });
    });
  }

  selectCharacter(character) {
    this.characterSelected = character;
    this.getSpecies(this.characterSelected.species[0])
    this.getFilms(this.characterSelected.films);
    this.getPlanets(this.characterSelected.homeworld);
  }

  close() {
    this.characterSelected = null;
    this.planets = null;
    this.films = [];
  }

}
