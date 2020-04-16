import { Component, OnInit, Input } from '@angular/core';
import { Film } from 'src/app/models/film.model';



@Component({
  selector: 'app-films-list',
  templateUrl: './films-list.component.html',
  styleUrls: ['./films-list.component.scss']
})
export class FilmsListComponent implements OnInit {

  @Input()
  films: Film[]

  constructor() { }

  ngOnInit(): void {
  }

}
