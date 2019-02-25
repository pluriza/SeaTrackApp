import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

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
    coreDirectives,
    formDirectives,
    materialInputDirectives,
    LoginComponent
  ],
  providers: [
    materialProviders
  ]
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
