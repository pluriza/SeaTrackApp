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
  UserRepository _userRepository;

  UserRepository get userRepository => _userRepository;
  AuthenticationBloc get authenticationBloc => _authenticationBloc;

  @override
  void ngOnInit() {
    _userRepository = UserRepository();
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.dispatch(AppStarted());
    print('Authentication State: ${_authenticationBloc.initialState}');
  }

  @override
  void ngOnDestroy() {
    _authenticationBloc.dispose();
  }
}
