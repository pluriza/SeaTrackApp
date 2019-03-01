import 'package:angular_router/angular_router.dart';
import './dashboard_component/dashboard.component.template.dart' as dashboard_template;
import './login_component/login.component.template.dart' as login_template;
import './route_paths.dart';

class AppRoutes {
  static final RouteDefinition login = RouteDefinition(
    routePath: AppRoutePaths.login,
    component: login_template.LoginComponentNgFactory,
  );

  static final RouteDefinition dashboard = RouteDefinition(
    routePath: AppRoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
    useAsDefault: true,
  );

  // Routes.all call this Array to display its content on router-outlet.
  static final List<RouteDefinition> all = <RouteDefinition>[
    login,
    dashboard,
    RouteDefinition.redirect(
      path: '', redirectTo: AppRoutePaths.login.toUrl(),
    ),
  ];
}