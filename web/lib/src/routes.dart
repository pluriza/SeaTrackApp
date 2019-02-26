import 'package:angular_router/angular_router.dart';
import './footer_component/footer.component.template.dart' as footer_template;
import './login_component/login.component.template.dart' as login_template;
import 'route_paths.dart';


export 'route_paths.dart';


class Routes {
  static final login = RouteDefinition(
    routePath: RoutePaths.login,
    component: login_template.LoginComponentNgFactory,
  );
  static final footer = RouteDefinition(
    routePath: RoutePaths.footer,
    component: footer_template.FooterComponentNgFactory
  );

  static final all = <RouteDefinition>[
    login,
    footer,
    RouteDefinition.redirect(
      path:'', redirectTo: RoutePaths.login.toUrl(),
    ),
    
  ];
}