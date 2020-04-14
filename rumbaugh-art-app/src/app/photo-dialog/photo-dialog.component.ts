import { Component, OnInit, Inject, ViewChild, AfterViewInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { environment } from 'src/environments/environment';
import { NgbCarouselConfig, NgbCarousel } from '@ng-bootstrap/ng-bootstrap';
import { Photo } from '../services/lychee/photo';

export interface PhotoDialogData {
  photos: Photo[];
  selectedIndex: number;
}

@Component({
  selector: 'app-photo-dialog',
  templateUrl: './photo-dialog.component.html',
  styleUrls: ['./photo-dialog.component.css']
})
export class PhotoDialogComponent implements OnInit, AfterViewInit {

  @ViewChild('carousel') carousel: NgbCarousel;

  photoServerUrl: string = environment.photoServerUrl;

  constructor(public dialogRef: MatDialogRef<PhotoDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: PhotoDialogData,
    public carouselConfig: NgbCarouselConfig) { 
      this.carouselConfig.keyboard = true;
      this.shiftUrlsLeft(this.data.selectedIndex);
    }

  ngOnInit(): void { }

  ngAfterViewInit() {
    this.carousel.pause();
  }

  private shiftUrlsLeft(spaces: number): void {
    for (let i = 0; i < spaces; i++) {
      let lastInd = this.data.photos.length - 1;
      let temp = this.data.photos[lastInd];
      this.data.photos[lastInd] = this.data.photos[0];

      for (let j = 0; j < lastInd; j++) {
        this.data.photos[j] = this.data.photos[j + 1];
      }

      this.data.photos[lastInd - 1] = temp;

    }
  }

}
