import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Core/AppRoute/app_route.dart';
import 'Language/language.dart';
import 'Utils/AppColors/app_colors.dart';
import 'Utils/AppConst/app_const.dart';
import 'helper/shared_prefe/shared_prefe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedCode = await SharedPrefe.getString(SharedPrefe.languageKey);
  final initialLocale = savedCode == 'en'
      ? const Locale('en', 'US')
      : const Locale('bn', 'BD');

  runApp(MyApp(initialLocale: initialLocale));
}

class MyApp extends StatelessWidget {
  final Locale initialLocale;

  const MyApp({super.key, required this.initialLocale});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: AppConst.appName,
          debugShowCheckedModeBanner: false,
          translations: Language(),
          locale: initialLocale,
          fallbackLocale: const Locale('bn', 'BD'),
          defaultTransition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 300),
          theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            scaffoldBackgroundColor: AppColors.backgroundColor,
            useMaterial3: true,
          ),
          initialRoute: AppRoute.splashScreen,
          getPages: AppRoute.getPages,
        );
      },
    );
  }
}
