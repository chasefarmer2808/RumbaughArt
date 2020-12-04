import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Album } from './album';
import { Photo } from './photo';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class LycheeService {

  readonly serverHostName: string = environment.serverUrl;
  readonly serverPort: string = environment.serverPort;
  readonly serverDirectory: string = environment.serverDirectory;

  private readonly baseUrl: string;

  constructor(private httpClient: HttpClient) {
    if (environment.production) {
      this.baseUrl = `https://${this.serverHostName}/api/v1`;
    }
    else {
      this.baseUrl = `http://${this.serverHostName}:${this.serverPort}/api/v1`;
    }
  }

  getPublicAlbums(): Observable<Album[]> {
    return this.httpClient.get<Album[]>(`${this.baseUrl}/album`);
  }

  getPhotosByAlbum(albumId: string): Observable<Photo[]> {
    let params = new HttpParams().set('album_id', albumId);
    return this.httpClient.get<Photo[]>(`${this.baseUrl}/photo`, { params: params });
  }

  getStaredPhotos(): Observable<Photo[]> {
    let params = new HttpParams().set('star', '1');
    return this.httpClient.get<Photo[]>(`${this.baseUrl}/photo`, { params: params });
  }

  getPhotosByTag(tag: string): Observable<Photo[]> {
    let params = new HttpParams().set('tags', tag);
    return this.httpClient.get<Photo[]>(`${this.baseUrl}/photo/tagged`, { params: params });
  }
}
