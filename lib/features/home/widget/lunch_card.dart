import 'package:guliva/core/utils/extensions.dart';

import '../../../core/utils/utils.dart';

class LunchCardWidget extends StatefulWidget {
  const LunchCardWidget({super.key});

  @override
  State<LunchCardWidget> createState() => _LunchCardWidgetState();
}

bool isFavorite = false;

class _LunchCardWidgetState extends State<LunchCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200.w,
        height: 300.h,
        child: Column(
          children: [
            // First part with background image
            Container(
              height: 210.h,
              width: 300.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/lunch.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.red[700],
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              ),
            ),
            // Second part with text
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Salad'
                          .toText(fontSize: 17.sp, fontWeight: FontWeight.w500),
                      '# 2000 - # 3000'
                          .toText(fontSize: 15.sp, fontWeight: FontWeight.w500)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      '4.5'
                          .toText(fontSize: 17.sp, fontWeight: FontWeight.w600),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
    //   Container(
    //     width: 200,
    //     height: 150,
    //     decoration: BoxDecoration(
    //     color: Colors.transparent,
    //     borderRadius: BorderRadius.circular(20.0),
    // ),
    // child: Stack(
    // children: [
    // // Bottom widget
    // Container(
    // width: 250,
    // height: 250,
    // decoration: BoxDecoration(
    // borderRadius: BorderRadius.circular(20.0),
    // ),child:'lunch'.pngPicture(height: 150.h,width: 250.w),
    // ),
    // // Middle widget
    // Positioned(
    // bottom: 0,
    // right: 25,
    // child:
    //     IconButton(
    //       icon: Icon(
    //         isFavorite ? Icons.favorite : Icons.favorite_border,
    //         color: isFavorite ? Colors.red : Colors.red[700],
    //       ),
    //       onPressed: () {
    //         setState(() {
    //           isFavorite = !isFavorite;
    //         });
    //       },
    //     ),
    // ),
    // // Top widget
    //
    // ],
    // ));
  }
}
