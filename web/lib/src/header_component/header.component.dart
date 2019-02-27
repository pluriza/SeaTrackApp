import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component (
  selector: 'header-menu',
  templateUrl: 'header.component.html',
  styleUrls: ['header.component.css'],
  directives: [
    coreDirectives,
    MaterialIconComponent,
    
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