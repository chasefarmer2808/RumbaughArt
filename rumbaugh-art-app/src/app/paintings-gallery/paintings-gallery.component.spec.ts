import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PaintingsGalleryComponent } from './paintings-gallery.component';

describe('PaintingsGalleryComponent', () => {
  let component: PaintingsGalleryComponent;
  let fixture: ComponentFixture<PaintingsGalleryComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PaintingsGalleryComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PaintingsGalleryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
