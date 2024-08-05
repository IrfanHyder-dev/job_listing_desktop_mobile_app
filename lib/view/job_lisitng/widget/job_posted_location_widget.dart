import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_listing_project/src/app/global_variables.dart';
import 'package:job_listing_project/src/theme/font_styles/light_font_style.dart';
import 'package:job_listing_project/src/theme/light_base_theme.dart';

class JobPostedLocationWidget extends ConsumerWidget{
  final int index;
  const JobPostedLocationWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final notifier = ref.watch(jobListingProvider);
    return Row(
      children: [
        Text(
          notifier.filterJobListing[index].postedAt ?? '',
          style: spartanRegular.copyWith(color: theme.focusColor),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: const Icon(
            Icons.circle,
            size: 7,
            color: scaffoldColor,
          ),
        ),
        Text(
          notifier.contractType(
              notifier.filterJobListing[index].contract!),
          style: spartanRegular.copyWith(color: theme.focusColor),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: const Icon(
            Icons.circle,
            size: 7,
            color: scaffoldColor,
          ),
        ),
        Text(
          notifier.filterJobListing[index].location ?? '',
          style: spartanRegular.copyWith(color: theme.focusColor),
        ),
      ],
    );
  }
}