import { BrowserModule, HAMMER_GESTURE_CONFIG, HammerModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule } from '@angular/core';
import { NgbCarouselModule } from '@ng-bootstrap/ng-bootstrap';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavbarComponent } from './navbar/navbar.component';
import { HomeComponent } from './home/home.component';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { GalleryComponent } from './gallery/gallery.component';
import { AboutComponent } from './about/about.component';
import { PhotoDialogComponent } from './photo-dialog/photo-dialog.component';
import { MaterialModule } from './material/material.module';
import { ContactComponent } from './contact/contact.component';
import { HttpsInterceptor } from './services/lychee/https-interceptor';
import { PaintingsGalleryComponent } from './paintings-gallery/paintings-gallery.component';

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    HomeComponent,
    GalleryComponent,
    AboutComponent,
    PhotoDialogComponent,
    ContactComponent,
    PaintingsGalleryComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    NgbCarouselModule,
    MaterialModule,
    HammerModule
  ],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: HttpsInterceptor, multi: true },
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
