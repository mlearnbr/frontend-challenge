import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { switchMap, tap, catchError, map, filter, distinct, share } from 'rxjs/operators';
import { CharacterService } from 'src/app/services/character.service';
import { Character } from 'src/app/models/character.model';
import { Observable, of, BehaviorSubject } from 'rxjs';

@Component({
  selector: 'app-characters-item',
  templateUrl: './characters-item.component.html',
  styleUrls: ['./characters-item.component.scss']
})
export class CharactersItemComponent implements OnInit {

  loading: boolean
  error: boolean

  characterId$: BehaviorSubject<string>
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

    this.characterId$ = new BehaviorSubject<string>(null)
    
    this.activatedRoute.params.subscribe(params => {
      this.characterId$.next(params.id)
    })


    this.character$ = this.characterId$.pipe(
      
      filter(id => id != null),
      tap(() => {
        this.loading = true
        this.error = false
      }),
      switchMap(id => {
        return this.characterService.getItemById(id).pipe(
          catchError(error => {
            this.error = true
            return of(null)
          })
        )
      }),

      tap(() => this.loading = false),

      share()
    )

  }

  load() {    
    
    this.characterId$.next(this.characterId$.value)

  }

  ngOnInit(): void {
  }

}
