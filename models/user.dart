import 'package:guesswho/models/school.dart';

class User {
  String hashedId;
  String gender;
  String wantGender;
  String role;
  String status;
  int pendingChatCount;
  int badge;
  School school;

  User(this.hashedId, this.gender, this.wantGender, this.role, this.status,
      this.pendingChatCount, this.badge, this.school);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        json['hashed_id'],
        json['gender'],
        json['want_gender'],
        json['role'],
        json['status'],
        json['pending_chat_count'],
        json['badge'],
        School.fromJson(json['school']));
  }
}
