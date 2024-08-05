import 'package:flutter/cupertino.dart';
import 'package:job_listing_project/src/app/static_info.dart';
import 'package:job_listing_project/view/job_lisitng/model/job_lisitng_model.dart';

class JobListingProvider extends ChangeNotifier {
  List<JobListingModel> filterJobListing = [];
  List<JobListingModel> jobListing = [];
  List<String> selectedLanguage = [];
  bool isFilterLanguageHover = false;
  bool isClearTextHover = false;
  bool isJobTitleHover = false;
  String selectedLang = '';
  int selectedJobIndex = -1;

  init() {
    jobListing = StaticInfo.jobListingJson
        .map(
          (item) => JobListingModel.fromJson(item),
        )
        .toList();
    filterJobListing.addAll(jobListing);
    notifyListeners();
  }

  void onTapLanguage(String language) {
    if (!selectedLanguage.contains(language)) {
      selectedLanguage.add(language);
      applyFilter();
    }
  }

  void updateFilters(String language) {
    selectedLanguage.removeWhere(
      (element) => element.contains(language),
    );
    applyFilter();
  }

  void applyFilter() {
    filterJobListing = jobListing.where((job) {
      List<String> jobLanguages = List<String>.from(job.languages!);
      return selectedLanguage.every((lang) => jobLanguages.contains(lang));
    }).toList();
    notifyListeners();
  }

  void clearFilter() {
    selectedLanguage.clear();
    filterJobListing.clear();
    filterJobListing.addAll(jobListing);
    notifyListeners();
  }

  void filterLanguageHover(bool val, String lang) {
    isFilterLanguageHover = val;
    selectedLang = lang;
    notifyListeners();
  }

  void clearTextHover(bool val) {
    isClearTextHover = val;
    notifyListeners();
  }

  void jobTitleHover(bool value, int index) {
    isJobTitleHover = value;
    selectedJobIndex = index;
    notifyListeners();
  }

  String contractType(Contract contract) {
    if (contract == Contract.CONTRACT) {
      return "Contract";
    } else if (contract == Contract.FULL_TIME) {
      return "Full Time";
    } else {
      return 'Part Time';
    }
  }
}
