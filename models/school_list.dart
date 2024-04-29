import 'package:guesswho/models/school.dart';

class SchoolList {
  dynamic schools;

  SchoolList(this.schools);

  factory SchoolList.fromJson(Map<String, dynamic> json) {
    return SchoolList(json['schools'] as dynamic);
  }
}
