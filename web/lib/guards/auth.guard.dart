import 'package:angular_router/angular_router.dart';
import 'package:core/core.dart';
import 'package:web/src/route_paths.dart';
import 'package:web/services/auth.service.dart';

class AuthGuard extends RouterHook {

  final AuthService _authService;
  AuthenticationState state;
  SeatrackSession userSession;
  String redirect;

  AuthGuard(this._authService);

  @override
  Future<String> navigationPath(String path, NavigationParams params) async {
    state = await _authService.authBloc.currentState;
    if (state is AuthenticationUnauthenticated) {
      var loginPath = AppRoutePaths.login.toUrl();
      print('Login Path: $loginPath');
      redirect = path.isNotEmpty ? path : null;
      if (params != null && params.queryParameters.containsKey('redirect')) {
        redirect = params.queryParameters['redirect'];
      }
      if (redirect == loginPath) {
        redirect = null;
      }
      return loginPath;
    }
    print('Path: $path');
    return path;
  }

  @override
  Future<NavigationParams> navigationParams(
      String path, NavigationParams params) async {
    if (state is AuthenticationUnauthenticated) {
      var qp = {};
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


// class RouteHook extends RouterHook {
//   final LoginService _loginService;
//   User user;
//   String redirect;

//   RouteHook(this._loginService);

//   @override
//   Future<String> navigationPath(String path, NavigationParams params) async {
//     user = await _loginService.fetchUser(checkSrv: true);
//     if (user == null) {
//       var loginPath = RoutePaths.login.toUrl();
//       redirect = path.length > 0 ? path : null;
//       if (params != null && params.queryParameters.containsKey('redirect')) {
//         redirect = params.queryParameters['redirect'];
//       }
//       if (redirect == loginPath) {
//         redirect = null;
//       }
//       return loginPath;
//     }
//     return path;
//   }

//   @override
//   Future<NavigationParams> navigationParams(
//       String path, NavigationParams params) async {
//     if (user == null) {
//       var qp = Map<String, String>();
//       if (params != null) {
//         qp.addAll(params.queryParameters);
//       }
//       redirect != null ? qp['redirect'] = redirect : qp.remove('redirect');
//       return NavigationParams(queryParameters: qp);
//     }
//     return params;
//   }
// }