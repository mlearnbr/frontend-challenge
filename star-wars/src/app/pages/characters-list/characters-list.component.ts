import { Component, OnInit } from '@angular/core';
import { Observable, BehaviorSubject } from 'rxjs';
import { shareReplay, map, filter } from 'rxjs/operators';
import { BreakpointObserver, Breakpoints } from '@angular/cdk/layout';
import { CharacterService } from 'src/app/services/character.service';
import { Character } from 'src/app/models/character.model';

@Component({
  selector: 'app-characters-list',
  templateUrl: './characters-list.component.html',
  styleUrls: ['./characters-list.component.scss']
})
export class CharactersListComponent implements OnInit {

  loading: boolean

  allCharacters$: BehaviorSubject<Character[]>
  shownCharacters$: Observable<Character[]>

  constructor(
    private characterService: CharacterService
  ) {}


  ngOnInit(): void {

    this.allCharacters$ = new BehaviorSubject<Character[]>([])
    this.shownCharacters$ = this.allCharacters$.pipe()

    this.load()

  }

  async load() {    
    
    this.loading = true
    
    const characters = await this.characterService.getList().toPromise()
    this.allCharacters$.next(characters)
    
    this.loading = false

  }

}
