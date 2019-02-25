import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:core/core.dart';
import 'package:web/src/index.dart';

@Component(
  selector: 'login-page',
  templateUrl: './login.component.html',
  directives: [
    coreDirectives, 
    formDirectives,
    materialInputDirectives,
  ],
  pipes: [BlocPipe]
)

class LoginComponent implements OnInit, OnDestroy {
  @override
  void ngOnInit() {

  }
  @override
  void ngOnDestroy() {

  }
}