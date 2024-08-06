import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/model/login.dart';
import '../../../core/utils/packages.dart';
import '../bloc/cubit.dart';
import '../view/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginController createState() => LoginController();
}

class LoginController extends State<LoginScreen> {
  //... //Initialization code, state vars etc, all go here
  final formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LoginView(this);

//Control logic grouped together, at top of file
  void onBackPressed() {
    Navigator.pop(context);
  }

  void onPressLoginButton() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    loginUser(email, password);
  }

  void loginUser(String username, String password) async {
    final Login data = Login();
    data.email = username;
    data.password = password;
    context.read<LoginCubit>().loginUser(data);
  }
}
