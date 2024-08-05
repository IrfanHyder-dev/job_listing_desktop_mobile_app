import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_listing_project/view/job_lisitng/provider/job_listing_provider.dart';

final jobListingProvider =AutoDisposeChangeNotifierProvider((ref) => JobListingProvider(),);