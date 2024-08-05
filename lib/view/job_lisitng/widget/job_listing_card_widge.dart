import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_listing_project/src/app/global_variables.dart';
import 'package:job_listing_project/src/theme/font_styles/light_font_style.dart';
import 'package:job_listing_project/src/theme/light_base_theme.dart';
import 'package:job_listing_project/view/job_lisitng/widget/company_name_row_widget.dart';
import 'package:job_listing_project/view/job_lisitng/widget/job_languages_widget.dart';
import 'package:job_listing_project/view/job_lisitng/widget/job_posted_location_widget.dart';

class JobListingCardWidget extends ConsumerStatefulWidget {
  final int index;

  const JobListingCardWidget({super.key, required this.index});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _JobListingCardWidgetState();
}

class _JobListingCardWidgetState extends ConsumerState<JobListingCardWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final notifier = ref.watch(jobListingProvider);
    return Container(
      height: 230,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border(
            left: BorderSide(color: theme.primaryColor, width: 5.w),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(-5, 2),
              color: theme.focusColor.withOpacity(0.09),
              blurRadius: 15,
              spreadRadius: 0,
            ),
          ]),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topLeft,
        children: [
          Positioned(
            top: -25,
            child: SizedBox(
              height: 70.h,
              width: 70.w,
              child: SvgPicture.asset(
                  notifier.filterJobListing[widget.index].logo ?? ''),
            ),
          ),
          Positioned(
            top: 25.h,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                CompanyNameRowWidget(index: widget.index),
                15.verticalSpace,
                InkWell(
                  onHover: (value) {
                    notifier.jobTitleHover(value, widget.index);
                  },
                  child: Text(
                    notifier.filterJobListing[widget.index].position ?? '',
                    style: spartanSemiBold.copyWith(
                        color: notifier.isJobTitleHover
                            ? theme.primaryColor
                            : theme.colorScheme.secondary),
                  ),
                ),
                15.verticalSpace,
                JobPostedLocationWidget(index: widget.index),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: const Divider(
                    color: scaffoldColor,
                  ),
                ),
                JobLanguagesWidget(
                  index: widget.index,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
