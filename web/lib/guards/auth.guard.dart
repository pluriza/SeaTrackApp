import 'package:angular_router/angular_router.dart';
import 'package:core/core.dart';

class AuthGuard implements RouterHook {
  AuthenticationBloc _authenticationBloc;
  Router _router;

  @override
  Future<bool> canActivate(
      Object componentInstance, RouterState current, RouterState next) async {
    // Make the default behavior to block all LoginRequired components
    // unless logged in.
    if (current.toUrl() != '/login' &&
        _authenticationBloc.state is AuthenticationAuthenticated) {
      await _router.navigate('/login');
      print('I Cannot Activate');
      return false;
    }
    print('I Can Activate');
    return true;
  }

  // Implement noSuchMethod(): When a class has a noSuchMethod()
  // it implements any method.
  // Hence, warning "Missing concrete implementation" gets supressed.
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}
