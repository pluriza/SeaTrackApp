import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:web/services/auth.service.dart';
import 'package:core/core.dart';

@Component(
    selector: 'login-page',
    templateUrl: './login.component.html',
    styleUrls: [
      './login.component.css'
    ],
    directives: [
      coreDirectives,
      formDirectives,
      materialInputDirectives,
      MaterialIconComponent,
      MaterialTooltipTargetDirective,
      MaterialMultilineInputComponent,
      MaterialInputComponent,
      MaterialButtonComponent,
    ])
class LoginComponent implements OnInit, OnDestroy {
  final AuthService _authService;
  LoginModel credentials = LoginModel(null, null);

  LoginComponent(this._authService);

  @override
  void ngOnInit() {
    _authService.initLoginBloc();
  }

  @override
  void ngOnDestroy() {
    _authService.disposeLoginBloc();
  }

  void loginUser() {
    _authService.authenticateUserOnLogin(credentials);
  }
}
