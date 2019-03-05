import 'package:core/core.dart';
import './storage.service.dart';

class AuthService {
  final StorageService _storageService = StorageService();
  final LoginApiProvider _loginApiProvider = LoginApiProvider();

  AuthenticationBloc authBloc;
  LoginBloc loginBloc;
  SeatrackSession session;
  bool authenticated = false;

  AuthService() {
    // Initialize the BLoC's.
    authBloc = AuthenticationBloc(storageProvider: _storageService);
    session = _storageService.hasTokenSync(Endpoints.sessionStorageKey);
    var inSession = session?.token?.isNotEmpty ?? false;
    if (inSession) {
      authenticated = true;
    } else {
      _storageService.deleteToken(Endpoints.sessionStorageKey);
    }
  }

  void initApp() {
    authBloc.dispatch(AppStarted());
  }

  void disposeApp() {
    authBloc.dispose();
  }

  void initLoginBloc() {
    loginBloc = LoginBloc(
        loginApiProvider: _loginApiProvider, authenticationBloc: authBloc);
  }

  void disposeLoginBloc() {
    loginBloc.dispose();
  }

  void authenticateUserOnLogin(LoginModel loginCredentials) {
    loginBloc.dispatch(LoginButtonPressed(
      username: loginCredentials.username,
      password: loginCredentials.password,
    ));
  }
}
