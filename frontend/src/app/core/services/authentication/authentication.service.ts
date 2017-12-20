import {Injectable} from '@angular/core';
import {Http, Response} from '@angular/http';
import {SystemConstants} from '../../common/system.constants';
import {ApiUrlConstants} from '../../common/api.url.constants';
import 'rxjs/add/operator/map';
import {User} from '../../models/models.component';

@Injectable()
export class AuthenticationService {

  constructor(private http: Http) {
  }

  login(username: String, password: String, remember: boolean) {
    const body = {
      name: username,
      password: password,
      remember: remember
    };

    return this.http.post(ApiUrlConstants.LOGIN, body)
      .map((response: Response) => {
        const user: User = response.json().user;
        user.token = response.json().token;
        remember = response.json().remember;
        if (user && user.token) {
          console.log(user.name);
          if (remember) {
            localStorage.removeItem(SystemConstants.CURRENT_USER);
            localStorage.setItem(SystemConstants.CURRENT_USER, JSON.stringify(user));
          } else {
            sessionStorage.removeItem(SystemConstants.CURRENT_USER);
            sessionStorage.setItem(SystemConstants.CURRENT_USER, JSON.stringify(user));
          }

          // this.cookieService.delete(SystemConstants.CURRENT_USER);
          // this.cookieService.set(SystemConstants.CURRENT_USER, JSON.stringify(user));
        }
      });
  }


  logout() {
    sessionStorage.removeItem(SystemConstants.CURRENT_USER);
    localStorage.removeItem(SystemConstants.CURRENT_USER);
    // this.cookieService.delete(SystemConstants.CURRENT_USER);
  }

  signUp(username: String, password: String) {
    const body = {
      name: username,
      password: password
    };

    return this.http.post(ApiUrlConstants.SIGN_UP, body)
      .map((response: Response) => {
        const user: User = response.json().user;
        user.token = response.json().token;
        if (user && user.token) {
          sessionStorage.removeItem(SystemConstants.CURRENT_USER);
          sessionStorage.setItem(SystemConstants.CURRENT_USER, JSON.stringify(user));
          // this.cookieService.delete(SystemConstants.CURRENT_USER);
          // this.cookieService.set(SystemConstants.CURRENT_USER, JSON.stringify(user));
        }
      });
  }

  getCurrentUser(): any {
    if (localStorage.getItem(SystemConstants.CURRENT_USER) !== null) {
      return JSON.parse(localStorage.getItem(SystemConstants.CURRENT_USER));
    }
    return JSON.parse(sessionStorage.getItem(SystemConstants.CURRENT_USER));
    // return this.cookieService.get(SystemConstants.CURRENT_USER);
  }

  isLoggedIn(): boolean {
    return this.getCurrentUser() !== null;
  }


}
