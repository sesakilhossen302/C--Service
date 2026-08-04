import 'package:flutter/material.dart';
import 'Core/AppRoute/app_route.dart';
import 'Utils/AppColors/app_colors.dart';
import 'Utils/AppConst/app_const.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConst.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        useMaterial3: true,
      ),
      initialRoute: AppRoute.splashScreen,
      routes: AppRoute.routes,
    );
  }
}

