import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:core/core.dart';
import 'package:web/src/index.dart';

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
    formDirectives,
    LoginComponent
  ],
  providers: [
    materialProviders
  ]
)
class AppComponent implements OnInit, OnDestroy {
  AuthenticationBloc _authenticationBloc;
  LoginApiProvider _loginApiProvider;

  LoginApiProvider get loginApiProvider => _loginApiProvider;
  AuthenticationBloc get authenticationBloc => _authenticationBloc;

  @override
  void ngOnInit() {
    _loginApiProvider = LoginApiProvider();
    print('Login Api Provider: $loginApiProvider');
    _authenticationBloc = AuthenticationBloc(
      loginApiProvider: _loginApiProvider);
    _authenticationBloc.dispatch(AppStarted());
  }

  @override
  void ngOnDestroy() {
    _authenticationBloc.dispose();
  }
}
