import 'package:core/core.dart';
import './storage.service.dart';

class AuthService {
  final StorageService _storageService = StorageService();
  final LoginApiProvider _loginApiProvider = LoginApiProvider();

  Future _checkToken;
  AuthenticationBloc authBloc;
  LoginBloc loginBloc;
  SeatrackSession session;
  bool authenticated = false;

  AuthService() {
    // Initialize the BLoC's.
    authBloc = AuthenticationBloc(storageProvider: _storageService);
    _checkToken = _initCheckToken();
  }

  Future _initCheckToken() async {
    session = await _storageService.hasToken(Endpoints.sessionStorageKey);
    bool inSession = session?.token ?? false;
    if (inSession) {
      authenticated = true;
    } else {
      await _storageService.deleteToken(Endpoints.sessionStorageKey);
    }
    print('Is Auth? $authenticated');
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
