import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_listing_project/src/app/global_variables.dart';
import 'package:job_listing_project/src/app/static_info.dart';
import 'package:job_listing_project/src/theme/font_styles/light_font_style.dart';
import 'package:job_listing_project/src/theme/light_base_theme.dart';

class FilterWidget extends ConsumerWidget {
  const FilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final notifier = ref.watch(jobListingProvider);
    return Container(
      width: 0.9.sw,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              offset: const Offset(-5, 2),
              color: theme.focusColor.withOpacity(0.09),
              blurRadius: 15,
              spreadRadius: 0,
            ),
          ]),
      child: Row(
        children: [
          SizedBox(
            width: 0.7.sw,
            child: Wrap(
              spacing: 16.0, // Horizontal space between items
              runSpacing: 10.0, // Vertical space between lines
              children: notifier.selectedLanguage.map(
                (e) {
                  return Container(
                    decoration: BoxDecoration(
                      color: theme.indicatorColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                (StaticInfo.isMobileDevice) ? 10.w : 7.w,
                          ),
                          child: Text(
                            e,
                            style: spartanSemiBold.copyWith(
                                color: theme.primaryColor,
                                fontSize: (StaticInfo.isMobileDevice)
                                    ? 15.sp
                                    : 10.sp),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            notifier.updateFilters(e);
                          },
                          onHover: (value) {
                            notifier.filterLanguageHover(value, e);
                          },
                          child: Container(
                            width: 30.w,
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    (StaticInfo.isMobileDevice) ? 10.h : 7.w),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5)),
                              color: (notifier.isFilterLanguageHover &&
                                      notifier.selectedLang == e)
                                  ? scaffoldColor
                                  : theme.primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                'X',
                                style: spartanSemiBold.copyWith(
                                    fontSize: 10.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          const Spacer(),
          10.horizontalSpace,
          InkWell(
            onTap: () {
              notifier.clearFilter();
            },
            onHover: (val) {
              notifier.clearTextHover(val);
            },
            child: Text(
              'Clear',
              style: spartanSemiBold.copyWith(
                color: theme.primaryColor,
                fontSize: 10.sp,
                decoration:
                    notifier.isClearTextHover ? TextDecoration.underline : null,
                decorationColor: theme.primaryColor,
                // Optional: Customize the color of the underline
                decorationThickness: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
