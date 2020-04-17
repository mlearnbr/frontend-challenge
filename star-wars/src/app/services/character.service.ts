import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Character } from '../models/character.model';
import { ApiService } from './api.service';
import { charactersListQueryDef, characterObjQueryDef, charactersListByFilmQueryDef } from '../queries/character.queries'
import { map, retry, tap } from 'rxjs/operators';
import { Film } from '../models/film.model';
import { compare } from '../helpers/compare.fn';


@Injectable({
  providedIn: 'root'
})
export class CharacterService {

  constructor(
    private apiService: ApiService
  ) { }


  getList(): Observable<Character[]> {

    const req = this.apiService.graphqlQuery(charactersListQueryDef())
    
    return req.pipe(
      
      retry(10),
      map(v => v.data.characters.results),
      
      map(list => {
        return list.map(v => {
          const obj: Character = {
            id: v.id,
            name: v.name,
            birthYear: v.birthYear,
            species: v.species.results.map(s => s.name)
          }
  
          return obj
        })
      })

    )

  }

  getListByFilm(film: Film): Observable<Character[]> {

    const req = this.apiService.graphqlQuery(charactersListByFilmQueryDef(film.id))
    
    return req.pipe(
      
      retry(10),
      map(v => v.data.film.characters.results),
      
      map(list => {
        return list.map(v => {
          const obj: Character = {
            id: v.id,
            name: v.name,
            birthYear: v.birthYear,
            species: v.species.results.map(s => s.name)
          }
  
          return obj
        })
      })

    )

  }



  getItemById(id: string): Observable<Character> {

    const req = this.apiService.graphqlQuery(characterObjQueryDef(id))
    
    return req.pipe(

      retry(10),
      map(v => v.data.character),
      
      map(v => {

        const obj: Character = {
          id: v.id,
          name: v.name,
          birthYear: v.birthYear,
          eyeColor: v.eyeColor,
          gender: v.gender,
          hairColor: v.hairColor,
          height: v.height,
          mass: v.mass,
          skinColor: v.skinColor,
          species: v.species.results.map(s => s.name),
          homeworld: v.homeworld.name,

          films: v.films.results.map(film => {
            
            const obj: Film = {
              id: film.id,
              title: film.title,
              releaseDate: film.releaseDate
            }
            
            return obj

          })
        }

        return obj

      }),

      tap( v => v.films.sort((a, b) => compare(a.title, b.title, true)) )
    )

  }

}
