import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/angular_components.dart';

import 'package:core/core.dart';
import 'package:web/src/index.dart';
import 'package:web/guards/auth.guard.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: [
    'package:angular_components/app_layout/layout.scss.css',
    './app.component.css'
  ],
  templateUrl: './app.component.html',
  directives: [
    coreDirectives,
    formDirectives,
    materialInputDirectives,
    routerDirectives,
    FooterComponent,
    NavBarComponent,
    LoginComponent,
  ],
  providers: [
    materialProviders,
    LoginApiProvider
  ],
  exports: [AppRoutePaths, AppRoutes]
)
class AppComponent implements OnInit, OnDestroy {
  // Login BLoC.
  AuthenticationBloc _authenticationBloc;
  LoginApiProvider _loginApiProvider;

  // // Routes.
  // final Router router;

  // Getter and Setters.
  LoginApiProvider get loginApiProvider => _loginApiProvider;
  AuthenticationBloc get authenticationBloc => _authenticationBloc;

  // Constructor.
  AppComponent(Router router, AuthGuard authGuard) {
    authGuard.router = router;
  }

  @override
  void ngOnInit() {
    // print('Router Current State: ${router.current}');

    // This section handles the Login BLoC.
    _loginApiProvider = LoginApiProvider();

    // Notify the BLoC of new event.
    _authenticationBloc = AuthenticationBloc(
      loginApiProvider: loginApiProvider);
    _authenticationBloc.dispatch(AppStarted());
  }

  @override
  void ngOnDestroy() {
    authenticationBloc.dispose();
  }

}