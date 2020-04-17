import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Film } from '../models/film.model';
import { filmsListQueryDef } from '../queries/films.queries';
import { ApiService } from './api.service';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class FilmService {

  constructor(
    private apiService: ApiService
  ) { }

  getList(): Observable<Film[]> {

    const req = this.apiService.graphqlQuery(filmsListQueryDef())
    
    return req.pipe(
      map(v => v.data.films.results),
      
      map(list => {
        return list.map(v => {
          const obj: Film = {
            id: v.id,
            title: v.title,
            releaseDate: v.releaseDate
          }
  
          return obj
        })
      })

    )

  }

}
