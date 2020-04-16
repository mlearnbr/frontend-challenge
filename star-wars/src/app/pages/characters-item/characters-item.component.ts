import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { switchMap, tap } from 'rxjs/operators';
import { CharacterService } from 'src/app/services/character.service';
import { Character } from 'src/app/models/character.model';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-characters-item',
  templateUrl: './characters-item.component.html',
  styleUrls: ['./characters-item.component.scss']
})
export class CharactersItemComponent implements OnInit {

  loading: boolean

  character$: Observable<Character>

  character = {
    name: 'Leia Organa'
  }

  constructor(
    private activatedRoute: ActivatedRoute,
    private characterService: CharacterService
  ) {

    this.listenId()

  }

  listenId() {

    this.character$ = this.activatedRoute.params.pipe(
      tap(() => this.loading = true),
      switchMap(v => this.characterService.getItemById(v.id)),
      tap(() => this.loading = false),
    )

  }

  ngOnInit(): void {
  }

}
