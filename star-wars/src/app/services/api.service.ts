import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  apiConfig = environment.api
  graphqlEndpoint = 'graphql'

	constructor(
		private http: HttpClient
  ) {	}
  


	post(uri, body, headers = {}): Observable<any> {

		var request = this.http.post(
			`${this.apiConfig.url}/${uri}`,
			body,
			{
				headers: headers
			}
		);

		return request;
  }
  
	graphqlQuery(queryString: string, inTokenRevalidation: boolean = false): Observable<any> {

    const headers = {
      'X-Parse-Application-Id': this.apiConfig.appId,
      'X-Parse-Master-Key': this.apiConfig.masterKey,
      'Content-Type': 'application/json'
    }

		return this.post(
			this.graphqlEndpoint,
			{ query: queryString },
			headers
		)

	}


}
