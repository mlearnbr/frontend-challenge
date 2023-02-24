import { Component } from '@angular/core';
import { NavController, NavParams, LoadingController } from 'ionic-angular';
import { FetchApiProvider } from '../../providers/fetch-api/fetch-api';

@Component({
  selector: 'page-info',
  templateUrl: 'info.html',
})
export class InfoPage {

  character : any = [];
  films : any = [];
  species : any = [];
  planet : any;

  constructor(
    public navCtrl: NavController,
    public navParams: NavParams,
    public loadCtrl: LoadingController,
    private serviceApi: FetchApiProvider
    ) { }

  ionViewDidLoad() {
    let load = this.loadCtrl.create();
    load.present();
    this.character = this.navParams.get('data');
    this.species = this.navParams.get('species');
    this.serviceApi.getPlanet(this.character.homeworld).then((data: any)=>{
     this.planet = data.name;
    });
    this.character.films.forEach(element=>{
      this.serviceApi.getFilmsName(element).then((film: any)=>{
        this.films.push(film.title);
      });
    });
    load.dismiss();
  }

}
