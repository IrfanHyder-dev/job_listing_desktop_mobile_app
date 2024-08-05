import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_listing_project/src/app/static_info.dart';
import 'package:job_listing_project/src/theme/font_styles/light_font_style.dart';

class NewFeatureContainerWidget extends StatelessWidget {

  final Color bgColor; final String text;

  const NewFeatureContainerWidget({super.key,required this.bgColor,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:(StaticInfo.isMobileDevice)? 10.w : 8.w  , vertical:(StaticInfo.isMobileDevice)?8.h: 5.h),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(50)),
      child: Text(
        text,
        style: spartanSemiBold.copyWith(color: Colors.white, fontSize:(StaticInfo.isMobileDevice)?15.sp: 8.sp),
      ),
    );
  }
}
