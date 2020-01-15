import { Component, OnInit, Renderer2 } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { LycheeService } from '../services/lychee/lychee.service';
import { flatMap } from 'rxjs/operators';
import { Photo } from '../services/lychee/photo';

@Component({
  selector: 'app-gallery',
  templateUrl: './gallery.component.html',
  styleUrls: ['./gallery.component.css']
})
export class GalleryComponent implements OnInit {

  albumId: string;
  photos: Photo[];
  avgPhotoWidth: number = 0;
  avgPhotoHeight: number = 0;

  constructor(private route: ActivatedRoute, 
    private lycheeService: LycheeService,
    private renderer: Renderer2) { }

  ngOnInit() {
    this.route.paramMap.pipe(
      flatMap(params => {
        this.albumId = params['params']['id'];
        return this.lycheeService.getPhotosByAlbum(this.albumId);
      })
    ).subscribe((photos: Photo[]) => {
      console.log(photos)
      this.photos = photos;
      this.setAverages();
    });
  }

  setAverages() {
    this.avgPhotoWidth = 0;
    this.avgPhotoHeight = 0;

    this.photos.forEach((photo: Photo) => {
      this.avgPhotoHeight += photo.height;
      this.avgPhotoWidth += photo.width;
    });

    this.avgPhotoHeight /= this.photos.length;
    this.avgPhotoWidth /= this.photos.length;
  }

  refreshGrid(event, photoIndex:number) {
    let imgParentElement = event.target.parentElement;
    let photo:Photo = this.photos[photoIndex];

    if (photo.width > this.avgPhotoWidth) {
      this.renderer.setStyle(imgParentElement, 'grid-column', 'span 2');
    } else if (photo.height > this.avgPhotoHeight) {
      this.renderer.setStyle(imgParentElement, 'grid-row', 'span 2');
    }
  }
}
