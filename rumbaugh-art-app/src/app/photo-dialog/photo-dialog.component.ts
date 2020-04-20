import { Component, OnInit, Inject, ViewChild, AfterViewInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { environment } from 'src/environments/environment';
import { NgbCarouselConfig, NgbCarousel, NgbSlideEvent } from '@ng-bootstrap/ng-bootstrap';
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
  currPhotoIndex: number = 0;
  currPhotoTitle: string;

  constructor(public dialogRef: MatDialogRef<PhotoDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: PhotoDialogData,
    public carouselConfig: NgbCarouselConfig) { 
      this.carouselConfig.keyboard = true;
      this.shiftUrlsLeft(this.data.selectedIndex);
    }

  ngOnInit(): void {
    this.currPhotoTitle = this.data.photos[this.data.selectedIndex].title;
  }

  ngAfterViewInit() {
    this.carousel.pause();
  }

  updatePhotoIndex(slideSource: string) {
    if (slideSource == 'arrowRight') {
      this.currPhotoIndex++;

      //Don't overflow.
      this.currPhotoIndex %= this.data.photos.length; 
    }
    else if (slideSource == 'arrowLeft') {
      this.currPhotoIndex--;

      // Don't underflow.
      if (this.currPhotoIndex < 0) {
        this.currPhotoIndex = this.data.photos.length - 1;
      }
    }
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
