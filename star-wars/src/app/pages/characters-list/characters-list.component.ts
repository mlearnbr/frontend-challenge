import { Component, OnInit, OnDestroy } from '@angular/core';
import { Observable, BehaviorSubject, Subject } from 'rxjs';
import { shareReplay, map, filter, startWith, debounceTime, takeUntil, tap, distinct, distinctUntilChanged } from 'rxjs/operators';
import { BreakpointObserver, Breakpoints } from '@angular/cdk/layout';
import { CharacterService } from 'src/app/services/character.service';
import { Character } from 'src/app/models/character.model';
import { FormControl } from '@angular/forms';
import { Film } from 'src/app/models/film.model';
import { FilmService } from 'src/app/services/film.service';


@Component({
  selector: 'app-characters-list',
  templateUrl: './characters-list.component.html',
  styleUrls: ['./characters-list.component.scss']
})
export class CharactersListComponent implements OnInit, OnDestroy {
  
  private destroy$ = new Subject<void>()

  
  filmControl = new FormControl()

  allFilms: Film[]
  filteredFilms: Observable<Film[]>;

  currentFilmFilter$: BehaviorSubject<Film>

  loading: boolean
  error: boolean

  characters$: BehaviorSubject<Character[]>
  shownCharacters$: Observable<Character[]>

  constructor(
    private characterService: CharacterService,
    private filmService: FilmService
  ) {

    this.characters$ = new BehaviorSubject<Character[]>([])
    this.currentFilmFilter$ = new BehaviorSubject<Film>({ id: null })

    this.setupFilmFilter()

  }


  ngOnInit(): void {


    this.load()

  }
  
  ngOnDestroy(): void {
    this.destroy$.next()
    this.destroy$.complete()
  }

  async load() {    
    
    this.loading = true
    this.error = false

    try {

      this.allFilms = await this.filmService.getList().toPromise()

      this.currentFilmFilter$.next(null)

    } catch(e) {
      this.error = true
    }

    this.loading = false

  }

  async getCharacters(film = null) {

    let filterFilm = film || this.currentFilmFilter$.value

    if(filterFilm && filterFilm.id == null)
      filterFilm = null

    if(filterFilm) {
      return await this.characterService.getListByFilm(filterFilm).toPromise()
    } else {
      return await this.characterService.getList().toPromise()
    }

  }


  setupFilmFilter() {

    this.filteredFilms = this.filmControl.valueChanges.pipe(
      takeUntil(this.destroy$),
      startWith(''),
      debounceTime(400),
      filter(v => typeof v === 'string'),
      map(title => this.filterFilms(title))
    )

    this.filmControl.valueChanges.pipe(
      
      takeUntil(this.destroy$),
      tap(v => {
        if(typeof v === 'object'){
          this.currentFilmFilter$.next(v)
        } else {
          this.currentFilmFilter$.next(null)
        }

      })

    ).subscribe()


    this.currentFilmFilter$.pipe(
      filter(v => v == null || v.id != null),
      tap(v => console.log(v)),
      distinctUntilChanged(),
      tap(v => console.log(v)),
    ).subscribe(async film => {

        console.log(film)
        this.loading = true
        this.error = false

        try {
          const characters = await this.getCharacters(film)
          this.characters$.next(characters)
        } catch(e) {
          this.error = true
        }

        this.loading = false
    })

  }

  filterFilms(title: string): Film[] {
    
    if(!this.allFilms)
      return []

    return this.allFilms.filter(
      f => f.title.toLowerCase().includes(title.toLowerCase())
    )

  }


  displayFilm(film: Film): string {

    if(film)
      return film.title
    
    return ''

  }


}
