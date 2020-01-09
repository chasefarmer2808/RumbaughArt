import { TestBed } from '@angular/core/testing';

import { LycheeService } from './lychee.service';
import { HttpClientModule } from '@angular/common/http';

describe('LycheeService', () => {
  beforeEach(() => TestBed.configureTestingModule({
    imports: [ HttpClientModule ]
  }));

  it('should be created', () => {
    const service: LycheeService = TestBed.get(LycheeService);
    expect(service).toBeTruthy();
  });
});
