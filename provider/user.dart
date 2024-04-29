import 'package:flutter/material.dart';
import 'package:guesswho/models/school.dart';

class UserContext extends ChangeNotifier {
  String _hashedId = '';
  String _gender = '';
  String _wantGender = '';
  String _role = '';
  String _status = '';
  int _pendingChatCount = 0;
  int _badge = 0;
  School _school = School(-1, "", "");

  String get hashedId => _hashedId;
  String get gender => _gender;
  String get wantGender => _wantGender;
  String get role => _role;
  String get status => _status;
  int get pendingChatCount => _pendingChatCount;
  int get badge => _badge;
  School get school => _school;

  void inputHashedId(String hashedId) {
    _hashedId = hashedId;
    notifyListeners();
  }

  void inputGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  void inputWantGender(String wantGender) {
    _wantGender = wantGender;
    notifyListeners();
  }

  void inputRole(String role) {
    _role = role;
    notifyListeners();
  }

  void inputStatus(String status) {
    _status = status;
    notifyListeners();
  }

  void inputPendingChatCount(int pendingChatCount) {
    _pendingChatCount = pendingChatCount;
    notifyListeners();
  }

  void inputBadge(int badge) {
    _badge = badge;
    notifyListeners();
  }

  void inputSchool(School school) {
    _school = school;
    notifyListeners();
  }
}
