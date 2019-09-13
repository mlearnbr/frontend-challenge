import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Results } from './results'

@Injectable({
  providedIn: 'root'
})
export class RequestsService {
  API = environment.api;

  constructor(private http: HttpClient) { }

  doGet(route) {
    return this.http.get<Results>(this.API + route);
  }
}
