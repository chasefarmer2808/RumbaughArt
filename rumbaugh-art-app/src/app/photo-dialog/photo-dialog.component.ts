import { Component, OnInit, Inject, HostListener } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { environment } from 'src/environments/environment';

export interface PhotoDialogData {
  photoUrls: string[];
  selectedIndex: number;
}

export enum KEY_CODE {
  RIGHT_ARROW = 39,
  LEFT_ARROW = 37
}

@Component({
  selector: 'app-photo-dialog',
  templateUrl: './photo-dialog.component.html',
  styleUrls: ['./photo-dialog.component.css']
})
export class PhotoDialogComponent implements OnInit {

  photoServerUrl: string = environment.photoServerUrl;

  @HostListener('window:keydown', ['$event'])
  keyEvent(event: KeyboardEvent) {
    if (event.keyCode == KEY_CODE.RIGHT_ARROW) {
      this.nextPhoto();
    }

    if (event.keyCode == KEY_CODE.LEFT_ARROW) {
      this.prevPhoto();
    }
  }

  constructor(public dialogRef: MatDialogRef<PhotoDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: PhotoDialogData) { }

  ngOnInit(): void { }

  nextPhoto() {
    this.data.selectedIndex++;
    this.data.selectedIndex %= this.data.photoUrls.length;
  }

  prevPhoto() {
    this.data.selectedIndex--;

    if (this.data.selectedIndex < 0) {
      this.data.selectedIndex = this.data.photoUrls.length - 1;
    }
  }

}
