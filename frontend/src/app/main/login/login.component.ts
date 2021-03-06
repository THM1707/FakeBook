import {AfterViewChecked, Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {AuthenticationService} from '../../core/services/authentication/authentication.service';
import {User} from '../../core/models/models.component';
import {NotificationService} from '../../core/services/notification/notification.service';
import {MessageConstants} from '../../core/common/message.constants';
import {SharedService} from '../../core/services/shared/shared.service';

declare const $: any;

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit, AfterViewChecked {
  @Output() onLoginSuccess = new EventEmitter();

  @Input() isLogin;
  @Input() isLoadingLogin = false;
  @Input() isLoadingSignup = false;
  user: User = new User();
  remember = false;
  userSignup: User = new User();
  repeatPassword: String;
  isPassWordMatch = false;


  constructor(public authService: AuthenticationService, private notifyService: NotificationService,
              private sharedService: SharedService) {

  }

  ngAfterViewChecked(): void {
    if (this.isLogin) {
      $('#login-li').click();
    } else {
      $('#signup-li').click();
    }
  }

  ngOnInit() {
    this.user = new User();
    this.userSignup = new User();
    this.isPassWordMatch = this.userSignup.password === this.repeatPassword;
    if (this.isLogin) {
      $('#login-li').trigger('click');
    } else {
      $('#signup-li').trigger('click');
    }
    this.sharedService.changeEmitted$.subscribe((text) => {
      this.isLoadingLogin = false;
      this.isLoadingSignup = false;
    });
  }

  login() {
    if (!this.user.password || !this.user.name) {
      return;
    }
    this.isLoadingLogin = true;
    this.authService.login(this.user.name, this.user.password, this.remember).subscribe(data => {
      this.onLoginSuccess.emit(MessageConstants.LOGIN_SUCCESS);
    }, error => {
      // this.notifyService.printErrorMessage(MessageConstants.LOGIN_FAILED);
      this.notifyService.handleAuthError(error);
      this.isLoadingLogin = false;
    });
  }



  signUp() {
    if (!this.userSignup.password || !this.userSignup.name || (this.repeatPassword !== this.userSignup.password)) {
      return;
    }
    this.isLoadingSignup = true;
    this.authService.signUp(this.userSignup.name, this.userSignup.password).subscribe(data => {
      this.onLoginSuccess.emit(MessageConstants.REGISTER_SUCCESS);
    }, error => {
      // this.notifyService.printErrorMessage(MessageConstants.REGISTER_FAILED);
      this.notifyService.handleAuthError(error);
      this.isLoadingSignup = false;
    });
  }
}
