import { Component, OnInit } from '@angular/core';
import { NavigationStart, Router } from '@angular/router';
import { LycheeService } from '../services/lychee/lychee.service';
import { Album } from '../services/lychee/album';
import { state, trigger, style, transition, animate } from '@angular/animations';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css'],
  animations: [
    trigger('slideDown', [
      state('up', style({
        height: '0px',
        overflow: 'hidden',
        opacity: '0'
      })),
      state('down', style({
        height: '*',
        overflow: 'hidden',
        opacity: 1
      })),
      transition('* => *', animate('300ms ease-in-out'))
    ])
  ]
})
export class NavbarComponent implements OnInit {

  galleries: Album[] = [];
  navActive: boolean = false;
  galleriesActive: boolean = false;
  currentUrl: string = '';

  constructor(private lycheeService: LycheeService, private router: Router) { }

  ngOnInit() {
    this.lycheeService.getPublicAlbums().subscribe((albums: Album[]) => {
      this.galleries = albums;
    });

    this.router.events.subscribe((event: RouterEvent) => {
      if (event instanceof NavigationStart) {
        this.currentUrl = event.url.slice(1);
        this.navActive = false;
      }
    })
  }

  toggleNav() {
    this.navActive = !this.navActive;
  }

  isOnCurrentRoute(routeUrl: string): boolean {
    return this.currentUrl == routeUrl;
  }

}
