import '../../../core/data/model/model.dart';
import '../../../core/utils/packages.dart';
import '../../auth/controller/login.dart';
import '../../auth/controller/splash.dart';
import '../view/home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeController createState() => HomeController();
}

class HomeController extends State<Home> {
  //... //Initialization code, state vars etc, all go here
  int selectedIndex = 0;
  static const List<Widget> widgetOptions = <Widget>[
    SplashScreen(),
    LoginScreen(),
    SplashScreen(),
    LoginScreen(),
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
  Widget build(BuildContext context) => HomeView(this);

//Control logic grouped together, at top of file
  List<Category> details = [
    Category(title: 'Rice', url: 'assets/images/cat.jpg'),
    Category(title: 'Stew', url: 'assets/images/stew.jpg'),
    Category(title: 'Soup', url: 'assets/images/soup.jpg'),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
