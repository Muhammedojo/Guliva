import 'package:flutter/cupertino.dart';
import 'package:guliva/core/utils/extensions.dart';

import '../../../core/data/model/model.dart';
import '../../../core/utils/utils.dart';
import '../../home/controller/dashboard.dart';

class OnboardWidget extends StatelessWidget {
  final Onboard data;
  const OnboardWidget({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                textAlign: TextAlign.left,
                '${data.title}',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.sp),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 11.sp,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const Dash()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Padding(
                  padding:
                      REdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                  child: 'Skip'.toText(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        '${data.url}'
            .pngPicture(height: 300.h, width: 300.w, fit: BoxFit.cover),
        SizedBox(
          height: 100.h,
        ),
        Text(
          textAlign: TextAlign.center,
          '${data.description}',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
