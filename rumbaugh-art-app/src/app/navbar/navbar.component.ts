import { Component, OnInit } from '@angular/core';
import { LycheeService } from '../services/lychee/lychee.service';
import { Album } from '../services/lychee/album';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  galleries: Album[] = [];

  constructor(private lycheeService: LycheeService) { }

  ngOnInit() {
    this.lycheeService.getPublicAlbums().subscribe((albums: Album[]) => {
      this.galleries = albums;
    });
  }

}
