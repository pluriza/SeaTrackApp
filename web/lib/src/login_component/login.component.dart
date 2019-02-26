import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:core/core.dart';
import 'package:web/src/index.dart';

@Component(
  selector: 'login-page',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
  directives: [
    coreDirectives, 
    formDirectives,
    materialInputDirectives,
    MaterialButtonComponent,
  ],
  pipes: [BlocPipe]
)

class LoginComponent implements OnInit, OnDestroy {
  @Input() UserRepository userRepository;
  @Input() AuthenticationBloc authenticationBloc;

  LoginBloc _loginBloc;

  @override
  void ngOnInit() {
    _loginBloc = LoginBloc(
      userRepository: userRepository,
      authenticationBloc: authenticationBloc
    );
  }

  @override
  void ngOnDestroy() {
    _loginBloc.dispose();
  }

  void onSubmit() {
    _loginBloc.dispatch(
      LoginButtonPressed(username: 'admin', password: '1234'));
  }
}