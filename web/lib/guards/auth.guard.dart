import 'package:angular_router/angular_router.dart';
import 'package:core/core.dart';
import 'package:web/src/route_paths.dart';
import 'package:web/services/auth.service.dart';

class AuthGuard extends RouterHook {
  final AuthService _authService;
  final String loginPath = AppRoutePaths.login.toUrl();
  final String dashboardPath = AppRoutePaths.dashboard.toUrl();
  AuthenticationState state;
  SeatrackSession userSession;
  String redirect;

  AuthGuard(this._authService);

  @override
  Future<String> navigationPath(String path, NavigationParams params) {
    if (!_authService.authenticated) {
      redirect = path.isNotEmpty ? path : null;
      if (params != null && params.queryParameters.containsKey('redirect')) {
        redirect = params.queryParameters['redirect'];
      }
      if (redirect == loginPath) {
        redirect = null;
      }
      return Future(() => loginPath);
    }
    return Future(() => dashboardPath);
  }

  @override
  Future<NavigationParams> navigationParams(
      String path, NavigationParams params) async {
    if (!_authService.authenticated) {
      var qp = <String, String>{};
      if (params != null) {
        qp.addAll(params.queryParameters);
      }
      redirect != null ? qp['redirect'] = redirect : qp.remove('redirect');
      return NavigationParams(queryParameters: qp);
    }
    return params;
  }

  // Implement noSuchMethod(): When a class has a noSuchMethod()
  // it implements any method.
  // Hence, warning "Missing concrete implementation" gets supressed.
  // dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}