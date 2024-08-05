import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_listing_project/src/app/global_variables.dart';
import 'package:job_listing_project/src/theme/font_styles/light_font_style.dart';
import 'package:job_listing_project/view/job_lisitng/widget/new_feature_container_widget.dart';

class CompanyNameRowWidget extends ConsumerStatefulWidget {
  final int index;
  const CompanyNameRowWidget({super.key,required this.index});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CompanyNameRowWidgetState();
}

class _CompanyNameRowWidgetState extends ConsumerState<CompanyNameRowWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final notifier = ref.watch(
        jobListingProvider);
    return Row(
      children: [
        Text(
          notifier.filterJobListing[widget.index].company ?? '',
          style: spartanSemiBold.copyWith(
              color: theme.primaryColor),
        ),
        15.horizontalSpace,
        if (notifier
            .filterJobListing[widget.index].jobListingModelNew!)
          NewFeatureContainerWidget(
              text: 'NEW!',
              bgColor: theme.primaryColor),
        10.horizontalSpace,
        if (notifier
            .filterJobListing[widget.index].jobListingModelNew!)
          NewFeatureContainerWidget(
              text: 'FEATURED',
              bgColor: theme.colorScheme.secondary)
      ],
    );
  }
}