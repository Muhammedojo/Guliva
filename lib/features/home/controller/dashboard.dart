import '../../../core/utils/packages.dart';
import '../../favourite/controller/favourite.dart';
import '../view/dashboard.dart';
import 'home.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  DashController createState() => DashController();
}

class DashController extends State<Dash> {
  //... //Initialization code, state vars etc, all go here
  int selectedIndex = 0;
  static const List<Widget> widgetOptions = <Widget>[
    Home(),
    Favourite(),
    Home(),
    Favourite(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DashView(this);

//Control logic grouped together, at top of file
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
