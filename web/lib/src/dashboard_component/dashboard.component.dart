import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:web/services/auth.service.dart';

@Component (
  selector: 'dashboard-page',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css'],
  directives: [
    coreDirectives
  ]
)

class DashboardComponent implements CanActivate {
  final AuthService _authService;

  DashboardComponent(this._authService);

  @override
  Future<bool> canActivate(RouterState current, RouterState next) async {
    if (_authService.authenticated) {
      return true;
    }
    return false;
  }
}