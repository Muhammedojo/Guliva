import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guliva/core/utils/extensions.dart';

import '../../../core/helper/widget_helper.dart';
import '../../../core/utils/utils.dart';
import '../controller/onboard.dart';

class OnBoardView extends StatelessView<OnBoard, OnBoardController> {
  const OnBoardView(OnBoardController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WidgetHelper.appBarBorderlessWithActionAndText2(
            context, () {}, () {},
            backgroundColor: AppColors.backgroundWhite,
            foregroundColor: AppColors.backgroundWhite),
        backgroundColor: AppColors.backgroundWhite,
        body: body(context));
  }

  Widget body(context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: SingleChildScrollView(
        child: Form(
          key: state.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: 'SIGN UP WITH EMAIL'
                    .toText(fontSize: 16.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 20.h,
              ),
              'First Name'.toText(),
              SizedBox(
                height: 5.h,
              ),
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
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16.0.h),
              'Last Name'.toText(),
              SizedBox(
                height: 5.h,
              ),
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
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16.0.h),
              'Phone Number'.toText(),
              SizedBox(
                height: 5.h,
              ),
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
                      return 'Please enter phone number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16.0.h),
              'Email'.toText(),
              SizedBox(
                height: 5.h,
              ),
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
              SizedBox(height: 40.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor: AppColors.guliBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    value: state.checked,
                    onChanged: (e) => state.toggleCheck(),
                  ),
                  SizedBox(width: 2.w),
                  RichText(
                    text: TextSpan(
                      text: "I agree to the ",
                      style: TextStyle(color: Colors.black, fontSize: 13.sp),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: "Terms and Conditions ",
                          style: TextStyle(color: Colors.red, fontSize: 13.sp),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: "and",
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: "Privacy Policy",
                          style: TextStyle(color: Colors.red, fontSize: 13.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            state.checked ? AppColors.guliBlue : Colors.grey,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              5.0), // Minimal border radius
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
                      child: 'SIGN UP'.toText(
                          color: AppColors.backgroundWhite, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
