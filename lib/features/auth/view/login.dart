import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guliva/core/helper/widget_helper.dart';
import 'package:guliva/core/utils/extensions.dart';
import 'package:guliva/features/home/controller/home.dart';
import '../../../core/utils/utils.dart';
import '../../home/controller/dashboard.dart';
import '../bloc/cubit.dart';
import '../controller/login.dart';
import '../controller/onboard.dart';

class LoginView extends StatelessView<LoginScreen, LoginController> {
  const LoginView(LoginController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: _body(context));
  }

  Widget _body(context) {
    return Scaffold(
      appBar: WidgetHelper.appBarBorder(context, () {}, () {},
          backgroundColor: AppColors.backgroundWhite,
          foregroundColor: Colors.black),
      body: body(context),
    );
  }

  Widget body(context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: Form(
        key: state.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            'Log In'.toText(fontSize: 20.sp, fontWeight: FontWeight.w800),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: 'LOG IN WITH...'
                  .toText(fontSize: 16.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.backgroundWhite,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.guliBlue, width: 1.w),
                      borderRadius:
                          BorderRadius.circular(5.0), // Minimal border radius
                    ),
                    padding: REdgeInsets.symmetric(
                        vertical: 15), // Padding for button height
                  ),
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   CupertinoPageRoute(builder: (context) => const Dash()),
                    // );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(FontAwesomeIcons.google),
                      SizedBox(width: 10.w),
                      'LOG IN'.toText(color: AppColors.guliBlue, fontSize: 16),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.backgroundWhite,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.guliBlue, width: 1.w),
                      borderRadius:
                          BorderRadius.circular(5.0), // Minimal border radius
                    ),
                    padding: REdgeInsets.symmetric(
                        vertical: 15), // Padding for button height
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(FontAwesomeIcons.facebookF),
                      SizedBox(width: 10.w),
                      'LOG IN'.toText(color: AppColors.guliBlue, fontSize: 16),
                    ],
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: 'LOG IN WITH EMAIL'
                  .toText(fontSize: 16.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 20.h,
            ),
            'Email address'.toText(),
            SizedBox(
              height: 60.h,
              child: TextFormField(
                controller: state.emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    // Reduced radius here
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0.r), // Reduced to 5
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 16.0.h),
            'Password'.toText(),
            SizedBox(height: 5.0.h),
            TextFormField(
              controller: state.passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  // Reduced radius here
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0.r), // Reduced to 5
                  ),
                ),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(height: 5.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                'Forgot Password?'.toText(color: Colors.red, fontSize: 15.sp)
              ],
            ),
            SizedBox(height: 30.0.h),
            BlocListener<LoginCubit, LoginState>(
              listener: (context, loginState) {
                if (loginState is LoginLoading) {
                  WidgetHelper.showProgress(text: "Checking");
                } else if (loginState is LoginLoaded) {
                  WidgetHelper.hideProgress();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                } else if (loginState is LoginFailure) {
                  WidgetHelper.hideProgress();
                  WidgetHelper.showToastError(
                      context, loginState.message.toString());
                }
              },
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.guliBlue,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              5.0), // Minimal border radius
                        ),
                        padding: REdgeInsets.symmetric(
                            vertical: 15), // Padding for button height
                      ),
                      onPressed: () {
                        // state.onPressLoginButton();
                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const Dash()),
                        );
                      },
                      child: 'LOG IN'.toText(
                          color: AppColors.backgroundWhite, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0.h),
            Center(
              child: Column(
                children: [
                  Icon(Icons.fingerprint_rounded, size: 60.sp),
                  SizedBox(height: 10.0.h),
                  'Touch / Face ID'.toText(fontSize: 16.sp),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(color: Colors.black, fontSize: 16.sp),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const OnBoard()),
                                  ),
                            text: "Sign up ",
                            style:
                                TextStyle(color: Colors.red, fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
