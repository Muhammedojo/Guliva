import 'package:flutter/cupertino.dart';
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
}
