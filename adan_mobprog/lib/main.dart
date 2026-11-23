import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/home_screen.dart';
import '/screens/newsfeed_screen.dart';

void main() {
  runApp(const AdanFacebook());
}

class AdanFacebook extends StatelessWidget {
  const AdanFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Facebook Replication',
          home: const HomeScreen(),
        );
      },
    );
  }
}