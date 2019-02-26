import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'package:core/core.dart';
import 'package:web/src/index.dart';

@Component(
  selector: 'login-page',
  templateUrl: './login.component.html',
  styleUrls: ['login.component.css'],
  directives: [
    coreDirectives, 
    formDirectives,
    materialInputDirectives,    
    MaterialIconComponent,
    MaterialTooltipTargetDirective,
    MaterialMultilineInputComponent,
    MaterialInputComponent,
    MaterialButtonComponent
    
  ],
  pipes: [BlocPipe]
)

class LoginComponent implements OnInit, OnDestroy {
  
  Router router;
  @override
  void ngOnInit() {

  }
  @override
  void ngOnDestroy() {

  }
  LoginComponent(this.router);

  void loginUser() {
    router.navigateByUrl('dashboard');
  }
}