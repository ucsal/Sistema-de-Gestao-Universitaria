import { Component, inject } from '@angular/core';
import { HousingLocationComponent } from '../housing-location/housing-location.component';
import { Housinglocation } from '../housinglocation';
import { CommonModule } from '@angular/common';
import { HousingService } from '../housing.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule, HousingLocationComponent],
  template: `<section>
      <form class="mt-2 ">
        <input
          type="text"
          placeholder="Filter by city"
          #filter
          (keydown.enter)="filterResults(filter.value, $event)"
        />

        <button
          class="primary "
          type="button"
          (click)="filterResults(filter.value, $event)"
        >
          Search
        </button>
      </form>
    </section>

    <section class="results">
      <app-housing-location
        *ngFor="let housingLocation of filteredLocationList"
        [housingLocation]="housingLocation"
      >
      </app-housing-location>
    </section>`,
  styleUrl: './home.component.scss',
})
export class HomeComponent {
  filteredLocationList: Housinglocation[] = [];
  housingLocationList: Housinglocation[] = [];
  housingService: HousingService = inject(HousingService);

  filterResults(text: string, event: any) {
    event.preventDefault();
    if (!text || text === '') {
      this.filteredLocationList = this.housingLocationList;
      return;
    }
    this.filteredLocationList = this.housingLocationList.filter(
      (housingLocation) =>
        housingLocation?.city.toLowerCase().includes(text.toLowerCase())
    );
    if (this.filteredLocationList.length === 0) {
      this.filteredLocationList = this.housingLocationList;

      alert('Nenhum resultado encontrado.');
    }
  }
  constructor(private route: Router) {
    this.housingService
      .getAllHousingLocations()
      .then((housingLocationList: Housinglocation[]) => {
        this.housingLocationList = housingLocationList;
        this.filteredLocationList = housingLocationList;
      });
  }
}
