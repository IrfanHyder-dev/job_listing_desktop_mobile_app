import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_listing_project/src/app/global_variables.dart';
import 'package:job_listing_project/src/app/static_info.dart';
import 'package:job_listing_project/src/theme/font_styles/light_font_style.dart';

class JobLanguagesWidget extends ConsumerWidget {
  final int index;

  const JobLanguagesWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final notifier = ref.watch(jobListingProvider);
    return Wrap(
      spacing: 16.0, // Horizontal space between items
      runSpacing: 10.0, // Vertical space between lines
      children: notifier.filterJobListing[index].languages!.map(
        (e) {
          return GestureDetector(
            onTap: () {
              notifier.onTapLanguage(e);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: (StaticInfo.isMobileDevice) ? 10.w : 7.w,
                  vertical: (StaticInfo.isMobileDevice) ? 10.h : 7.w),
              decoration: BoxDecoration(
                color: theme.indicatorColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                e,
                style: spartanSemiBold.copyWith(
                    color: theme.primaryColor,
                    fontSize: (StaticInfo.isMobileDevice) ? 15.sp : 10.sp),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
