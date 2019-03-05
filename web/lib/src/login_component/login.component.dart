import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:web/services/auth.service.dart';
import 'package:core/core.dart';
import 'package:web/src/route_paths.dart';

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
  final Router _router;
  LoginModel credentials = LoginModel(null, null);

  LoginComponent(this._authService, this._router);

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
    _authService.authBloc.state.listen((state) {
      if (state is AuthenticationAuthenticated) {
        _authService.authenticated = true;
        print('Triggered Navigation!!!');
        _router.navigate(AppRoutePaths.dashboard.toUrl());
      }
    });
  }
}
