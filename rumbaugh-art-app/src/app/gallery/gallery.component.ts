import { Component, OnInit, Renderer2 } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { LycheeService } from '../services/lychee/lychee.service';
import { flatMap } from 'rxjs/operators';
import { Photo } from '../services/lychee/photo';
import { imgListFade } from '../animations/imgListFade';
import { environment } from 'src/environments/environment';
import { MatDialog } from '@angular/material/dialog';
import { PhotoDialogComponent, PhotoDialogData } from '../photo-dialog/photo-dialog.component';

@Component({
  selector: 'app-gallery',
  templateUrl: './gallery.component.html',
  styleUrls: ['./gallery.component.css'],
  animations: [imgListFade]
})
export class GalleryComponent implements OnInit {

  albumId: string;
  photos: Photo[] = [];
  // photoUrls: string[] = [];
  photoServerUrl: string = environment.photoServerUrl;
  // Make sure this thresh matches the minmax set in the css grid.
  readonly photoThreshPx: number = 550;

  constructor(private route: ActivatedRoute, 
    private lycheeService: LycheeService,
    private renderer: Renderer2,
    public photoDialog: MatDialog) { }

  ngOnInit() {
    this.route.paramMap.pipe(
      flatMap(params => {
        this.albumId = params['params']['id'];
        return this.lycheeService.getPhotosByAlbum(this.albumId);
      })
    ).subscribe((photos: Photo[]) => {
      this.photos = photos;
    });
  }

  refreshGrid(event, photoIndex:number) {
    let imgParentElement = event.target.parentElement.parentElement;
    let photo:Photo = this.photos[photoIndex];

    let dimentionDiff: number = photo.width - photo.height;

    // Make photo wider or taller in the grid based on its actual dimentions.
    if (dimentionDiff > this.photoThreshPx) {
      this.renderer.setStyle(imgParentElement, 'grid-column', 'span 2');
    } 
    else if (dimentionDiff < (this.photoThreshPx * -1)) {
      this.renderer.setStyle(imgParentElement, 'grid-row', 'span 2');
    }
    else {
      this.renderer.setStyle(imgParentElement, 'grid-column', 'span 2');
      this.renderer.setStyle(imgParentElement, 'grid-row', 'span 2');
    }
  }

  openPhotoDialog(selectedIndex: number) {
    let photosCopy: Photo[] = [];

    let dialogData: PhotoDialogData = {
      photos: Object.assign(photosCopy, this.photos),
      selectedIndex
    };

    this.photoDialog.open(PhotoDialogComponent, { data: dialogData });
  }
}
