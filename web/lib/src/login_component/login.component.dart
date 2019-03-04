import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

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
    ],
    pipes: [
      BlocPipe
    ])
class LoginComponent implements OnInit, OnDestroy {
  @Input() AuthenticationBloc authBloc;

  final LoginApiProvider _loginApiProvider = LoginApiProvider();
  
  LoginBloc loginBloc;
  LoginModel credentials = LoginModel(null, null);

  // Constructor.


  @override
  void ngOnInit() {
    loginBloc = LoginBloc(
        loginApiProvider: _loginApiProvider,
        authenticationBloc: authBloc);
  }

  @override
  void ngOnDestroy() {
    loginBloc.dispose();
  }

  void loginUser() {
    loginBloc.dispatch(LoginButtonPressed(
      username: credentials.username,
      password: credentials.password,
    ));
  }
}
