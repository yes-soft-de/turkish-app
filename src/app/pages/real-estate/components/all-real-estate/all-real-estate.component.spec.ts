import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AllRealEstateComponent } from './all-real-estate.component';

describe('AllRealEstateComponent', () => {
  let component: AllRealEstateComponent;
  let fixture: ComponentFixture<AllRealEstateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AllRealEstateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AllRealEstateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
