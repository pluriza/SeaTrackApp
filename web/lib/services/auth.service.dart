import 'package:angular_router/angular_router.dart';
import 'package:core/core.dart';
import './storage.service.dart';

class AuthService {
  final StorageService storageService = StorageService();
  final Router _router;
  bool authenticated = false;

  AuthService(this._router) {
    SeatrackSession session;
    storageService
        .hasToken(Endpoints.sessionStorageKey)
        .then((data) => {session = data});
    if (session.token.isNotEmpty) {
      authenticated = true;
    } else {
      storageService.deleteToken(Endpoints.sessionStorageKey);
    }
  }
}
