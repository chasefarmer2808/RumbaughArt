import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Album } from './album';
import { Photo } from './photo';

@Injectable({
  providedIn: 'root'
})
export class LycheeService {

  private baseUrl = 'http://localhost:5000/api/v1'

  constructor(private httpClient: HttpClient) { }

  getPublicAlbums(): Observable<Album[]> {
    return this.httpClient.get<Album[]>(`${this.baseUrl}/album`);
  }

  getPhotosByAlbum(albumId: string): Observable<Photo[]> {
    let params = new HttpParams().set('album_id', albumId);
    return this.httpClient.get<Photo[]>(`${this.baseUrl}/photo`, {params: params});
  }
}
