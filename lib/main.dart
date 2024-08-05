import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_listing_project/src/app/static_info.dart';
import 'package:job_listing_project/src/theme/light_theme.dart';
import 'package:job_listing_project/view/job_lisitng/view/job_listing_view.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('===================== screen with is ${MediaQuery.of(context).size.width }');
    print('===================== screen with is ${MediaQuery.of(context).size.height }');
    StaticInfo.isMobileDevice =(MediaQuery.of(context).size.width > 375)? false:true ;
    return ScreenUtilInit(
      designSize: (StaticInfo.isMobileDevice)?const Size(430, 932):const Size(1366, 705),
      minTextAdapt: false,
      builder: (_, child) {
        return MaterialApp(
          title: 'Job Listing',
          debugShowCheckedModeBanner: false,
          theme: LightTheme().theme,
          themeMode: ThemeMode.light,
          home: const JobListingView(),
        );
      },
    );
  }
}

