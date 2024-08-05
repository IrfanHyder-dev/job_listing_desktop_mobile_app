import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_listing_project/src/app/global_variables.dart';
import 'package:job_listing_project/src/theme/font_styles/light_font_style.dart';
import 'package:job_listing_project/view/job_lisitng/widget/company_name_row_widget.dart';
import 'package:job_listing_project/view/job_lisitng/widget/job_languages_widget.dart';
import 'package:job_listing_project/view/job_lisitng/widget/job_posted_location_widget.dart';

class DesktopJobListingCardWidget extends ConsumerStatefulWidget {
  final int index;

  const DesktopJobListingCardWidget({super.key, required this.index});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DesktopJobListingCardWidgetState();
}

class _DesktopJobListingCardWidgetState
    extends ConsumerState<DesktopJobListingCardWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final notifier = ref.watch(jobListingProvider);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 70.h,
            width: 70.w,
            child: SvgPicture.asset(
                notifier.filterJobListing[widget.index].logo ?? ''),
          ),
          10.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CompanyNameRowWidget(index: widget.index),
              10.verticalSpace,
              InkWell(
                onTap: () {},
                onHover: (value) {
                  notifier.jobTitleHover(value, widget.index);
                },
                child: Text(
                  notifier.filterJobListing[widget.index].position ?? '',
                  style: spartanSemiBold.copyWith(
                      color: (notifier.isJobTitleHover &&
                              notifier.selectedJobIndex == widget.index)
                          ? theme.primaryColor
                          : theme.colorScheme.secondary),
                ),
              ),
              10.verticalSpace,
              JobPostedLocationWidget(index: widget.index)
            ],
          ),
          const Spacer(),
          JobLanguagesWidget(
            index: widget.index,
          ),
        ],
      ),
    );
  }
}
