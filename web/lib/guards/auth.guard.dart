import 'package:angular_router/angular_router.dart';
import 'package:core/core.dart';

class AuthGuard implements RouterHook {
  Router _router;
  AuthenticationState _authBlocState;

  AuthGuard(Router router, AuthenticationState authBlocState)
      : _router = router,
        _authBlocState = authBlocState;

  @override
  Future<bool> canActivate(
      Object componentInstance, RouterState current, RouterState next) async {
    // Make the default behavior to block all LoginRequired components
    // unless logged in.
    if (current.toUrl() != '/login') {
      await _router.navigate('/login');
      print('I Cannot Activate');
      return false;
    }
    print('I Can Activate');
    return true;
  }

  @override
  Future<bool> canNavigate() async {
    print('Can Navigate');
    if (_authBlocState is AuthenticationAuthenticated) {
      print('Yes, it can');
      return true;
    }
    print('Nope');
    return false;
  }

  // Implement noSuchMethod(): When a class has a noSuchMethod()
  // it implements any method.
  // Hence, warning "Missing concrete implementation" gets supressed.
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}
