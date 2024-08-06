import '../../../core/data/model/model.dart';
import '../../../core/utils/packages.dart';
import '../../auth/controller/login.dart';
import '../../auth/controller/splash.dart';
import '../view/favourite.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  FavouriteController createState() => FavouriteController();
}

class FavouriteController extends State<Favourite> {
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
  Widget build(BuildContext context) => FavouriteView(this);

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
