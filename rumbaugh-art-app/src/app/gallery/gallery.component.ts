import { Component, OnInit } from '@angular/core';
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

  constructor(private route: ActivatedRoute, private lycheeService: LycheeService) { }

  ngOnInit() {
    this.route.paramMap.pipe(
      flatMap(params => {
        console.log(params);

        this.albumId = params['params']['id'];
        return this.lycheeService.getPhotosByAlbum(this.albumId);
      })
    ).subscribe((photos: Photo[]) => {
      console.log(photos)
    });
  }
}
