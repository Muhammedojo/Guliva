import 'package:flutter/services.dart';
import 'package:guliva/core/utils/extensions.dart';
import 'package:guliva/features/home/widget/video_page.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/utils/utils.dart';
import '../controller/home.dart';
import '../widget/category_card.dart';
import '../widget/lunch_card.dart';

class HomeView extends StatelessView<Home, HomeController> {
  const HomeView(HomeController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite, body: _body(context));
  }

  Widget _body(context) {
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
                  InkWell(
                      onTap: () {
                        // showModal(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoPlayerPage()),
                        );
                      },
                      child: const Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.amber,
                      ))
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

  void showModal(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 350.h,
              ),
              child: Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.r)),
                  ),
                  child: _buildNumberOfBagsField(setState, context)),
            );
          },
        );
      },
      isScrollControlled: true,
    );
  }

  Widget _buildNumberOfBagsField(StateSetter setState, context) {
    final ImagePicker _picker = ImagePicker();
    XFile? _imageFile;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Container(
            width: 36.w,
            height: 4.h,
            margin: EdgeInsets.only(bottom: 12.h),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ),
        10.verticalSpace,
        TextFormField(
          controller: state.bagController,
          style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              height: 1.5,
              fontStyle: FontStyle.normal),
          maxLines: 1,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff909190), width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff088008), width: 1.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff909190), width: 1.w),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE93426), width: 1.w),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff909190), width: 1.w),
            ),
            hintText: '',
            fillColor: Colors.white,
            filled: true,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a number';
            }
            if (int.tryParse(value) == null) {
              return 'Invalid number';
            }

            return null;
          },
        ),
        20.verticalSpace,
        TextFormField(
          controller: state.bagController,
          style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              height: 1.5,
              fontStyle: FontStyle.normal),
          maxLines: 1,
          enabled: false,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff909190), width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff088008), width: 1.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff909190), width: 1.w),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE93426), width: 1.w),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff909190), width: 1.w),
            ),
            hintText: '',
            fillColor: Colors.white,
            filled: true,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a number';
            }
            if (int.tryParse(value) == null) {
              return 'Invalid number';
            }

            return null;
          },
        ),
        20.verticalSpace,
        Column(
          children: <Widget>[
            InkWell(
              onTap: () async {
                final XFile? pickedFile =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    _imageFile = pickedFile;
                  });
                }
              },
              child: Container(
                padding:
                    REdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.upload_file, color: Colors.white),
                    SizedBox(width: 8.w),
                    Text(
                      _imageFile == null ? 'Choose File' : 'Change Image',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        20.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        )
      ],
    );
  }
}
