import 'package:angular/angular.dart';
import 'package:web/app_component.template.dart' as ng;
import 'package:angular_router/angular_router.dart';

// Import the main.dart file to reference it within the program as “self”
import 'main.template.dart' as self;

// This section provides the Dependency Injector "routerProviders"
// available to every component within our program.
@GenerateInjector(routerProviders)
// Generates an Injector Factory at compile time.
// $Injector is used to retrieve object instances as defined by router provider.
// self.injector references to the main file referencing the Injector.
final InjectorFactory injector = self.injector$Injector;

// Create the Injector.
void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
