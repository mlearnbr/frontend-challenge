import { Component, OnInit } from '@angular/core';
import { getPeopleData } from '../utils/utils';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.less']
})
export class HomeComponent implements OnInit {

  starWarsPeople = [];
  somePersonWasSelected: boolean = true;
  selectedPerson;


  constructor() { 
    this.somePersonWasSelected = false;
  }

  ngOnInit() {
    new Promise((resolve, reject) => {
      getPeopleData('https://swapi.co/api/people', [], resolve, reject)
    })
      .then(response => {
        this.starWarsPeople = Object.values(response);
      })
  }

  showPerson(person) {
    this.somePersonWasSelected = !this.somePersonWasSelected;
    this.selectedPerson = person;
  }

  chooseAnotherCharacter() {
    this.somePersonWasSelected = !this.somePersonWasSelected;
  }

}
