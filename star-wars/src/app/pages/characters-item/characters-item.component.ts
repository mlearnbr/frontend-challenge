import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-characters-item',
  templateUrl: './characters-item.component.html',
  styleUrls: ['./characters-item.component.scss']
})
export class CharactersItemComponent implements OnInit {

  character = {
    name: 'Leia Organa'
  }

  constructor(
    private activatedRoute: ActivatedRoute
  ) {

    this.activatedRoute.params.subscribe(v => {
      console.log(`Personagem selecionado: ${v.id}`)
    })

  }

  ngOnInit(): void {
  }

}
