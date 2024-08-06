import '../../../core/data/model/model.dart';
import '../../../core/utils/utils.dart';

class CategoryWidget extends StatelessWidget {
  final Category data;
  const CategoryWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width
      height: 100, // Fixed height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: DecorationImage(
          image: AssetImage(
            '${data?.url}', // Replace with your image URL
          ),
          fit: BoxFit.cover, // Cover the entire container
        ),
      ),
      child: Center(
        child: Text(
          '${data?.title}',
          style: TextStyle(
            color: Colors.white, // Text color
            fontSize: 24.sp, // Text size
            fontWeight: FontWeight.bold, // Text weight
          ),
        ),
      ),
    );
  }
}
