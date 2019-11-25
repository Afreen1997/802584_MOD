import { TestBed, async, inject } from '@angular/core/testing';

import { Guard4Guard } from './guard4.guard';

describe(' Guard4Guard', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [Guard4Guard]
    });
  });

  it('should ...', inject([Guard4Guard], (guard: Guard4Guard) => {
    expect(guard).toBeTruthy();
  }));
});
