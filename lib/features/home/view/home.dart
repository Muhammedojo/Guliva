import 'package:guliva/core/utils/extensions.dart';

import '../../../core/utils/utils.dart';
import '../controller/home.dart';
import '../widget/category_card.dart';
import '../widget/lunch_card.dart';

class HomeView extends StatelessView<Home, HomeController> {
  const HomeView(HomeController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.backgroundWhite, body: _body());
  }

  Widget _body() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Goodday Moses!'
                          .toText(fontSize: 14.sp, fontWeight: FontWeight.w500),
                      'What will you like to cook?'
                          .toText(fontSize: 17.sp, fontWeight: FontWeight.w600)
                    ],
                  ),
                  const Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.amber,
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 50.h,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for any food',
                    fillColor: Colors.grey[300],
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0.r),
                      ),
                    ),
                    prefixIcon: const Icon(Icons.search_outlined),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  'Something Good For Lunch'
                      .toText(fontSize: 17.sp, fontWeight: FontWeight.w600)
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 280.h,
                child: Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => const LunchCardWidget(),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10.w,
                    ),
                    itemCount: 8,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  'Categories'
                      .toText(fontSize: 17.sp, fontWeight: FontWeight.w600)
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 400.h,
                child: ListView.separated(
                  itemBuilder: (context, index) => CategoryWidget(
                    data: state.details[index],
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.w,
                  ),
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
