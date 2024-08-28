import { EventEmitter, Component, Output } from '@angular/core';
import { AxiosService } from '../axios.service';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { MatToolbarModule } from '@angular/material/toolbar';
import { NgbAlert } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [FormsModule, MatToolbarModule, NgbAlert],
  template: `
    <section class="d-flex">
      <div class="container">
        <div class="row justify-content-center">
          <form
            (ngSubmit)="onSubmitLogin()"
            id="loginForm"
            class="col col-md-10 login-form"
          >
            <div class="form">
              <div class="input">
                <label class="mb-4">User Login</label>
                <input
                  type="text"
                  name="login"
                  id="login"
                  placeholder="Login"
                  [(ngModel)]="login"
                />

                <input
                  type="password"
                  name="password"
                  id="password"
                  placeholder="password"
                  [(ngModel)]="password"
                />

                <button type="submit">login</button>
                <p><a href="#">Esqueceu a senha?</a></p>
              </div>
            </div>
            <p>
              <ngb-alert [dismissible]="true" *ngIf="errorMsg">
                <strong>Error!</strong> {{ errorMsg }}
              </ngb-alert>
            </p>
          </form>
        </div>
      </div>
    </section>
  `,
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent {
  @Output() onSubmitLoginEvent = new EventEmitter();
  @Output() onSubmitRegisterEvent = new EventEmitter();
  constructor(private axiosService: AxiosService) {}
  login: string = '';
  password: string = '';
  errorMsg: string = '';
  onSubmitLogin(): void {
    this.axiosService
      .request('POST', '/auth/login', {
        login: this.login,
        password: this.password,
      })
      .then((response) => {
        this.axiosService.setAuthToken(response.data.token);
        console.log(response.data.token);
      })
      .catch((error) => {
        this.axiosService.setAuthToken(null);
        this.errorMsg = 'Ocorreu um erro: ' + error.message;
      });
  }
}
