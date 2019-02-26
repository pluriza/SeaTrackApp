import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
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
    NgIf
  ],
  providers: [
    materialProviders
  ],
  exports: [RoutePaths, Routes]
)
class AppComponent implements OnInit, OnDestroy{
  // Nothing here yet. All logic is in TodoListComponent.
  Router _router;
  Location _location;
  String show = 'true';
  

  AppComponent(this._router, this._location);

  void ngOnInit() {
    _logIt(_location);
    window.console.log(_router);
  }

  void ngOnDestroy() {
    _logIt(_location);
  }

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