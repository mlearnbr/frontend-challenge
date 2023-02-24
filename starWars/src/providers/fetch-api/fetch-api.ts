import { Http } from '@angular/http';
import { Injectable } from '@angular/core';

@Injectable()
export class FetchApiProvider {

  baseUrl: String = 'https://swapi.co/api';

  constructor(public http: Http) { }

  //buscando personagens
  async fetchCharacters() {
    return new Promise(async (resolve, rejected) => {
      await this.http.get(this.baseUrl + '/people/')
        .subscribe((res) => {
          var data = res.json().results;
          resolve(data);
        }, err => {
          rejected(err)
        })
    })
  }

  //buscando filmes do personagem
  async getFilmsName(url) {
    return new Promise(async (resolve, rejected) => {
      await this.http.get(url)
        .subscribe((res) => {
          resolve(res.json());
        }, err => {
          rejected(err);
        })
    })
  }

  //buscando espécies do personagem
  async fetchSpecies(url) {
    return new Promise(async (resolve, rejected) => {
      await this.http.get(url)
        .subscribe((res: any) => {
            resolve(res.json().name);
        }, err => {
          rejected(err);
        })
    })
  }

  //buscando planeta do personagem
  async getPlanet(url){
    return new Promise(async(resolve, rejected)=>{
      await this.http.get(url)
      .subscribe((res)=>{
        resolve(res.json());
      }, err =>{
        rejected(err)
      })
    })
  }

}
