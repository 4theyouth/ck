import 'package:flutter/material.dart';

class SignupContext extends ChangeNotifier {
  String _gender = '';
  String _wantGender = '';
  String _phoneNumber = '';
  String _verificationCode = '';
  int _age = -1;
  int _schoolId = -1;

  String get gender => _gender;
  String get wantGender => _wantGender;
  String get phoneNumber => _phoneNumber;
  String get verificationCode => _verificationCode;
  int get age => _age;
  int get schoolId => _schoolId;

  void inputGender(String gender) {
    if (gender == 'M' || gender == 'F') _gender = gender;
    notifyListeners();
  }

  void inputWantGender(String wantGender) {
    if (gender == 'M' || gender == 'F') _wantGender = wantGender;
    notifyListeners();
  }

  void inputPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void inputVerificationCode(String verificationCode) {
    _verificationCode = verificationCode;
    notifyListeners();
  }

  void inputAge(int age) {
    _age = age;
    notifyListeners();
  }

  void inputSchoolId(int schoolId) {
    _schoolId = schoolId;
    notifyListeners();
  }
}
