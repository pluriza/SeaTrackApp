import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular/angular.dart';

@Component (
  selector: 'footer-page',
  templateUrl: 'footer.component.html',
  styleUrls: ['footer.component.css'],
  directives: [
    coreDirectives
  ],
  pipes: [BlocPipe]
)

class FooterComponent implements OnInit, OnDestroy {

  @override
  void ngOnInit() {

  }
  @override
  void ngOnDestroy() {

  }

}