import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_listing_project/src/app/global_variables.dart';
import 'package:job_listing_project/src/app/static_info.dart';
import 'package:job_listing_project/src/theme/light_base_theme.dart';
import 'package:job_listing_project/view/job_lisitng/widget/desktop_job_listing_card_widget.dart';
import 'package:job_listing_project/view/job_lisitng/widget/filter_widget.dart';
import 'package:job_listing_project/view/job_lisitng/widget/job_listing_card_widge.dart';

class JobListingView extends ConsumerStatefulWidget {
  const JobListingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobListingViewState();
}

class _JobListingViewState extends ConsumerState<JobListingView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        ref.read(jobListingProvider).init();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(jobListingProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 156.h,
            color: focusColor.withOpacity(0.66),
            child: (StaticInfo.isMobileDevice)
                ? SvgPicture.asset(
                    'assets/bg_header_mobile.svg',
                    fit: BoxFit.cover,
                  )
                : SvgPicture.asset(
                    'assets/bg_header_desktop.svg',
                    fit: BoxFit.cover,
                  ),
          ),
          20.verticalSpace,
          if (notifier.selectedLanguage.isNotEmpty) const FilterWidget(),
          30.verticalSpace,
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
              physics: const BouncingScrollPhysics(),
              itemCount: notifier.filterJobListing.length,
              itemBuilder: (context, index) {
                return (StaticInfo.isMobileDevice)
                    ? JobListingCardWidget(index: index)
                    : DesktopJobListingCardWidget(index: index);
              },
              separatorBuilder: (context, index) => 50.verticalSpace,
            ),
          )
        ],
      ),
    );
  }
}
