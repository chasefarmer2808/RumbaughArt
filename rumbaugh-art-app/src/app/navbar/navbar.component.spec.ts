import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';

import { NavbarComponent } from './navbar.component';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { RouterTestingModule } from '@angular/router/testing';
import { DebugElement } from '@angular/core';
import { LycheeService } from '../services/lychee/lychee.service';
import { of } from 'rxjs';
import { AlbumsMock } from '../services/lychee/albums.mock';

describe('NavbarComponent', () => {
  let component: NavbarComponent;
  let fixture: ComponentFixture<NavbarComponent>;
  let de: DebugElement;
  let lycheeService: LycheeService;
  let getPublicAlbumsSpy: any;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ NavbarComponent ],
      imports: [
        HttpClientTestingModule,
        RouterTestingModule
      ],
      providers: [ LycheeService ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NavbarComponent);
    component = fixture.componentInstance;
    de = fixture.debugElement;
    lycheeService = de.injector.get(LycheeService);

    getPublicAlbumsSpy = spyOn(lycheeService, 'getPublicAlbums')
      .and.returnValue(of(AlbumsMock));

    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should load albums on init', () => {
    fixture.detectChanges()

    fixture.whenStable().then(() => {
      fixture.detectChanges();
      expect(component.galleries).toEqual(AlbumsMock);
    });
  });
});
