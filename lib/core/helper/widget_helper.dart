import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:guliva/core/utils/extensions.dart';

import '../utils/utils.dart';

class WidgetHelper {
  static appBarBorderlessWithActionAndText2(
      BuildContext context, Function() onTap, Function() onTapAction,
      {required Color backgroundColor, required Color foregroundColor}) {
    return AppBar(
        title: 'guliva_header'.pngPicture(height: 80.h),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: backgroundColor,
        leading: InkWell(
          onTap: onTap,
          child: Icon(
            CupertinoIcons.back,
            color: AppColors.guliBlue,
            size: 20.0.sp,
          ),
        ),
        actions: const []);
  }

  static appBarBorder(
      BuildContext context, Function() onTap, Function() onTapAction,
      {required Color backgroundColor, required Color foregroundColor}) {
    return AppBar(
        title: 'guliva_header'.pngPicture(height: 80.h),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: backgroundColor,
        actions: const []);
  }

  static showProgress({String? text}) {
    if (text != null && text.isNotEmpty) {
      return EasyLoading.show(
        status: text,
        maskType: EasyLoadingMaskType.black,
      );
    }
    return EasyLoading.show(
        indicator: const CircularProgressIndicator(
      strokeWidth: 2.0,
      color: Colors.white,
    ));
  }

  static showToastError(BuildContext context, String message,
      {String? actionLabel, Function? onActionPressed}) {
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.guliBlue,
      content:
          Text(message, style: TextStyle(fontSize: 14.sp, color: Colors.white)),
      action: onActionPressed != null
          ? SnackBarAction(
              label: actionLabel ?? "Close",
              textColor:
                  AppColors.backgroundWhite, // or some operation you would like
              onPressed: () {
                onActionPressed();
                // on block runs when label is pressed
              },
            )
          : null,
    ));
  }

  static hideProgress() {
    return EasyLoading.dismiss();
  }
}
