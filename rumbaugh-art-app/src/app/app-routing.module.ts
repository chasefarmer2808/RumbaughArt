import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { LycheeService } from './services/lychee/lychee.service';
import { Album } from './services/lychee/album';
import { GalleryComponent } from './gallery/gallery.component';
import { AboutComponent } from './about/about.component';
import { ContactComponent } from './contact/contact.component';
import { PaintingsGalleryComponent } from './paintings-gallery/paintings-gallery.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'gallery/:id', component: GalleryComponent },
  { path: 'paintings', component: PaintingsGalleryComponent },
  { path: 'about', component: AboutComponent },
  { path: 'contact', component: ContactComponent },
  { path: '**', redirectTo: '', component: HomeComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { relativeLinkResolution: 'legacy' })],
  exports: [RouterModule]
})
export class AppRoutingModule {
  constructor() { }
}
