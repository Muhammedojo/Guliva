import 'package:flutter/services.dart';
import 'core/utils/packages.dart';
import 'features/auth/controller/splash.dart';

class Guliva extends StatelessWidget {
  const Guliva({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: false,
        rebuildFactor: (old, data) {
          return true;
        },
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
            },
          );
        });
  }
}
