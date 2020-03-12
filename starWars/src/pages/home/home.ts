import { Component } from '@angular/core';
import { NavController, ModalController, LoadingController } from 'ionic-angular';
import { FetchApiProvider } from '../../providers/fetch-api/fetch-api';
import { InfoPage } from '../info/info';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  characters : any = [];
  constructor(
    public navCtrl: NavController,
    public modalCtrl: ModalController,
    public loadCtrl: LoadingController,
    private serviceApi: FetchApiProvider,
  ) { }

  async ionViewDidLoad() {
    let load = this.loadCtrl.create();
    load.present;
    await this.getCharacters();
    load.dismiss();
  }

  openInfo(character) {
    this.navCtrl.push(InfoPage, { 'data': character, 'species': character.species })
  }

  async getCharacters() {

    await this.serviceApi.fetchCharacters().then(async (data: any) => {
      await data.forEach(async (character: any) => {
        character.species = await character.species.map(async (spec: any) => {
          let specie = await this.serviceApi.fetchSpecies(spec).then((data) => {
            return data;
          });
          return specie;
        });

      });
      this.characters = data;
    }).catch((err) => {
      alert(err);
    })
  }

}
