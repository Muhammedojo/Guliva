import '../../../core/utils/utils.dart';
import '../controller/favourite.dart';
import '../widget/favourite_card.dart';

class FavouriteView extends StatelessView<Favourite, FavouriteController> {
  const FavouriteView(FavouriteController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              foregroundColor: Colors.transparent,
              bottom: PreferredSize(
                preferredSize:
                    Size.fromHeight(30.0.h), // Set the preferred height
                child: Container(
                  color: Colors.white,
                  child: const TabBar(
                    indicatorColor: Colors.blue,
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: 'Favorite Food'),
                      Tab(text: 'Favorite Chef'),
                    ],
                  ),
                ),
              )),
          backgroundColor: AppColors.backgroundWhite,
          body: _body()),
    );
  }

  Widget _body() {
    return TabBarView(
      children: [
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 400.h,
                child: ListView.separated(
                  itemBuilder: (context, index) => const FavoriteCardWidget(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.w,
                  ),
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 400.h,
                child: ListView.separated(
                  itemBuilder: (context, index) => FavoriteCardWidget(
                      // data: state.details[index],
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
      ],
    );
  }
}
