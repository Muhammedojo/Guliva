import 'package:guliva/core/utils/extensions.dart';

import '../../../core/utils/utils.dart';

class FavoriteCardWidget extends StatefulWidget {
  const FavoriteCardWidget({super.key});

  @override
  State<FavoriteCardWidget> createState() => _FavoriteCardWidgetState();
}

bool isFavorite = false;

class _FavoriteCardWidgetState extends State<FavoriteCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // First part with background image
        Container(
          height: 210.h,
          width: 200.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/lunch.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Second part with text
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'Jeff Benz'
                      .toText(fontSize: 18.sp, fontWeight: FontWeight.w700),
                  IconButton(
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
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 160.w,
                child: 'Some description related to your app here.'
                    .toText(fontSize: 15.sp, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ],
    );
  }
}
