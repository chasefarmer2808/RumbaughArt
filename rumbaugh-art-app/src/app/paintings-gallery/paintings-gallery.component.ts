import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { environment } from 'src/environments/environment';
import { LycheeService } from '../services/lychee/lychee.service';
import { Photo } from '../services/lychee/photo';

@Component({
  selector: 'app-paintings-gallery',
  templateUrl: './paintings-gallery.component.html',
  styleUrls: ['./paintings-gallery.component.css']
})
export class PaintingsGalleryComponent implements OnInit {

  photos: Photo[] = [];
  photoServerUrl: string = environment.photoServerUrl;

  constructor(private lycheeService: LycheeService, public photoDialog: MatDialog) { }

  ngOnInit(): void {
    this.lycheeService.getPhotosByTag('painting').subscribe(photos => {
      this.photos = photos;
    })
  }

}
