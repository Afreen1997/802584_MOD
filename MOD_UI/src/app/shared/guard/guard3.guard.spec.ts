import { TestBed, async, inject } from '@angular/core/testing';

import { Guard3Guard } from './guard3.guard';

describe('Guard3Guard', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [Guard3Guard]
    });
  });

  it('should ...', inject([Guard3Guard], (guard: Guard3Guard) => {
    expect(guard).toBeTruthy();
  }));
});
