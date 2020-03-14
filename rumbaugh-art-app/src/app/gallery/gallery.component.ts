import { Component, OnInit, Renderer2 } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { LycheeService } from '../services/lychee/lychee.service';
import { flatMap } from 'rxjs/operators';
import { Photo } from '../services/lychee/photo';
import { imgListFade } from '../animations/imgListFade';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-gallery',
  templateUrl: './gallery.component.html',
  styleUrls: ['./gallery.component.css'],
  animations: [imgListFade]
})
export class GalleryComponent implements OnInit {

  albumId: string;
  photos: Photo[] = [];
  photoServerUrl: string = environment.photoServerUrl;
  // Make sure this thresh matches the minmax set in the css grid.
  readonly photoThreshPx: number = 300;

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
      this.photos = photos;
    });
  }

  refreshGrid(event, photoIndex:number) {
    let imgParentElement = event.target.parentElement;
    let photo:Photo = this.photos[photoIndex];

    // Make photo wider or taller in the grid based on its actual dimentions.
    if (photo.width > this.photoThreshPx) {
      this.renderer.setStyle(imgParentElement, 'grid-column', 'span 2');
    } 
    
    if (photo.height > this.photoThreshPx) {
      this.renderer.setStyle(imgParentElement, 'grid-row', 'span 2');
    }
  }
}
