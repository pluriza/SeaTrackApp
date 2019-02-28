import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:core/core.dart';
import 'package:angular_router/angular_router.dart';
import 'package:web/src/index.dart';
import 'package:web/src/route_paths.dart';
import 'src/routes.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: [
    'package:angular_components/app_layout/layout.scss.css',
    './app_component.css'
  ],
  templateUrl: './app_component.html',
  directives: [
    coreDirectives,
    formDirectives,
    materialInputDirectives,
    routerDirectives,
    FooterComponent,
    HeaderComponent,
    LoginComponent,
  ],
  providers: [
    materialProviders
  ],
  exports: [AppRoutePaths, AppRoutes]
)
class AppComponent implements OnInit, OnDestroy {
  // Login BLoC.
  AuthenticationBloc _authenticationBloc;
  LoginApiProvider _loginApiProvider;

  // Routes.
  Router _router;
  Location _location;
  String show = 'true';

  // Getter and Setters.
  LoginApiProvider get loginApiProvider => _loginApiProvider;
  AuthenticationBloc get authenticationBloc => _authenticationBloc;

  // Constructor.
  AppComponent(this._router, this._location);

  @override
  void ngOnInit() {
    _logIt(_location);
    window.console.log(_router);

    // This section handles the Login BLoC.
    _loginApiProvider = LoginApiProvider();
    print('Login Api Provider: $loginApiProvider');
    _authenticationBloc = AuthenticationBloc(
      loginApiProvider: _loginApiProvider);
    _authenticationBloc.dispatch(AppStarted());
  }

  @override
  void ngOnDestroy() {
    _authenticationBloc.dispose();
    _logIt(_location);
  }

  // Method used to handle routing paths.
  String _logIt(Location route) {
    dynamic url;
    url = route.path();
    if (url == '/login') {
      show = "true";
    } else {
      show = "false";
    }
    return show;
  }
}