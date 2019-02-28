import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular/angular.dart';

@Component (
  selector: 'dashboard-page',
  templateUrl: 'dashboard.component.html',
  styleUrls: ['dashboard.component.css'],
  directives: [
    coreDirectives
  ],
  pipes: [BlocPipe]
)

class DashboardComponent implements OnInit, OnDestroy {

  @override
  void ngOnInit() {

  }
  @override
  void ngOnDestroy() {

  }

}