import { Component, OnInit } from '@angular/core';
import { LycheeService } from '../services/lychee/lychee.service';
import { Photo } from '../services/lychee/photo';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  staredPhotos: Photo[] = [];
  photoServerUrl: string = environment.photoServerUrl;

  constructor(private lycheeService: LycheeService) { }

  ngOnInit() {
    this.lycheeService.getStaredPhotos().subscribe((photos: Photo[]) => {
      this.staredPhotos = photos;
    })
  }

}
