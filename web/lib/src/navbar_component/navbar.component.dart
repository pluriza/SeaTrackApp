import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';

import 'package:web/src/index.dart';

@Component (
  selector: 'navbar',
  templateUrl: 'navbar.component.html',
  styleUrls: ['navbar.component.css'],
  directives: [
    coreDirectives,
    routerDirectives,
    MaterialIconComponent,
  ],
  pipes: [BlocPipe],
  exports: [AppRoutes, AppRoutePaths]
)

class HeaderComponent implements OnInit, OnDestroy {

  @override
  void ngOnInit() {

  }
  @override
  void ngOnDestroy() {

  }

}