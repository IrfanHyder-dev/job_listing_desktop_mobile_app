// To parse this JSON data, do
//
//     final jobListingModel = jobListingModelFromJson(jsonString);

import 'dart:convert';

List<JobListingModel> jobListingModelFromJson(String str) => List<JobListingModel>.from(json.decode(str).map((x) => JobListingModel.fromJson(x)));

String jobListingModelToJson(List<JobListingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobListingModel {
  int? id;
  String? company;
  String? logo;
  bool? jobListingModelNew;
  bool? featured;
  String? position;
  String? role;
  Level? level;
  String? postedAt;
  Contract? contract;
  String? location;
  List<String>? languages;
  List<String>? tools;

  JobListingModel({
    this.id,
    this.company,
    this.logo,
    this.jobListingModelNew,
    this.featured,
    this.position,
    this.role,
    this.level,
    this.postedAt,
    this.contract,
    this.location,
    this.languages,
    this.tools,
  });

  factory JobListingModel.fromJson(Map<String, dynamic> json) => JobListingModel(
    id: json["id"],
    company: json["company"],
    logo: json["logo"],
    jobListingModelNew: json["new"],
    featured: json["featured"],
    position: json["position"],
    role: json["role"],
    level: levelValues.map[json["level"]]!,
    postedAt: json["postedAt"],
    contract: contractValues.map[json["contract"]]!,
    location: json["location"],
    languages: json["languages"] == null ? [] : List<String>.from(json["languages"]!.map((x) => x)),
    tools: json["tools"] == null ? [] : List<String>.from(json["tools"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company": company,
    "logo": logo,
    "new": jobListingModelNew,
    "featured": featured,
    "position": position,
    "role": role,
    "level": levelValues.reverse[level],
    "postedAt": postedAt,
    "contract": contractValues.reverse[contract],
    "location": location,
    "languages": languages == null ? [] : List<dynamic>.from(languages!.map((x) => x)),
    "tools": tools == null ? [] : List<dynamic>.from(tools!.map((x) => x)),
  };
}

enum Contract {
  CONTRACT,
  FULL_TIME,
  PART_TIME
}

final contractValues = EnumValues({
  "Contract": Contract.CONTRACT,
  "Full Time": Contract.FULL_TIME,
  "Part Time": Contract.PART_TIME
});

enum Level {
  JUNIOR,
  MIDWEIGHT,
  SENIOR
}

final levelValues = EnumValues({
  "Junior": Level.JUNIOR,
  "Midweight": Level.MIDWEIGHT,
  "Senior": Level.SENIOR
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
