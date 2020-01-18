import { Component, OnInit } from '@angular/core';
import { LycheeService } from '../services/lychee/lychee.service';
import { Photo } from '../services/lychee/photo';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  staredPhotos: Photo[] = [];

  constructor(private lycheeService: LycheeService) { }

  ngOnInit() {
    this.lycheeService.getStaredPhotos().subscribe((photos: Photo[]) => {
      console.log(photos)
      this.staredPhotos = photos;
    })
  }

}
