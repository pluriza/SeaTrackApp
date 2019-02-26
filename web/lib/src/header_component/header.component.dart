import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular/angular.dart';

@Component (
  selector: 'header-menu',
  templateUrl: 'header.component.html',
  styleUrls: ['header.component.css'],
  directives: [
    coreDirectives
  ],
  pipes: [BlocPipe]
)

class HeaderComponent implements OnInit, OnDestroy {

  @override
  void ngOnInit() {

  }
  @override
  void ngOnDestroy() {

  }

}