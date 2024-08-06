import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../../../core/data/model/model.dart';
import '../view/onboard.dart';
import 'login.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  OnBoardController createState() => OnBoardController();
}

class OnBoardController extends State<OnBoard> {
  //... //Initialization code, state vars etc, all go here
  bool visible = true;
  final formKey = GlobalKey();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final passwordController = TextEditingController();

  toggleCheck() {
    setState(() {
      checked = !checked;
    });
  }

  toggleVisibility() {
    setState(() {
      visible = !visible;
    });
  }

  bool checked = false;

  @override
  void initState() {
    super.initState();
  }

  List<Onboard> details = [
    Onboard(
        description: 'With just a click, you can create how your meal plan.',
        title: 'Create your own bespoke menu whenever you want.',
        url: 'kit'),
    Onboard(
        description:
            'Select what ingredient goes into your meal while you cook.',
        title: 'Personalize your meal plan.',
        url: 'kit4'),
    Onboard(
        description: 'Your favorite chef is just a click away.',
        title: 'Choose your preferred chef to join you in making your meal.',
        url: 'kit2')
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => OnBoardView(this);

  void goToRegister() {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => const Login()),
    );
  }

  void goToLogin() {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => const Login()),
    );
  }
}
