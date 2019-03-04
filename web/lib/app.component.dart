import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/angular_components.dart';

import 'package:web/src/index.dart';
import 'package:web/services/services.dart';

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
      materialProviders
    ],
    exports: [AppRoutePaths, AppRoutes])
class AppComponent implements OnInit, OnDestroy {
  final AuthService _authService;

  AppComponent(this._authService);

  @override
  void ngOnInit() {
    _authService.initApp();
  }

  @override
  void ngOnDestroy() {
    _authService.disposeApp();
  }
}
