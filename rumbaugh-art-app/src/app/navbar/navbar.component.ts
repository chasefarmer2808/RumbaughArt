import { Component, OnInit } from '@angular/core';
import { NavigationStart, Router } from '@angular/router';
import { LycheeService } from '../services/lychee/lychee.service';
import { Album } from '../services/lychee/album';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  galleries: Album[] = [];
  navActive: boolean = false;

  constructor(private lycheeService: LycheeService, private router: Router) { }

  ngOnInit() {
    this.lycheeService.getPublicAlbums().subscribe((albums: Album[]) => {
      this.galleries = albums;
    });

    this.router.events.subscribe(event => {
      if (event instanceof NavigationStart) {
        this.navActive = false;
      }
    })
  }

  toggleNav() {
    this.navActive = !this.navActive;
  }

}
