import 'package:guliva/core/utils/extensions.dart';
import '../../../core/utils/utils.dart';
import '../controller/splash.dart';

class SplashScreenView
    extends StatelessView<SplashScreen, SplashScreenController> {
  const SplashScreenView(SplashScreenController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.guliBlue, body: _body());
  }

  Widget _body() {
    return Center(
      child: 'guli'.pngPicture(height: 200, width: 200),
    );
  }
}
