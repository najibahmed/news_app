import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  // prevent making instance
  MySharedPref._();
  static const String isOnBoardingChecked = 'isOnBoardingChecked';


  /// init get storage services
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // get storage
  static late SharedPreferences _sharedPreferences;
  /// check onBoarding status
  static Future<bool> setOnBoardingStatus(bool status) async {
    return _sharedPreferences.setBool(isOnBoardingChecked, status);
  }
  static Future<bool> getOnBoardingStatus() async {
    return _sharedPreferences.getBool(isOnBoardingChecked) ?? false;
  }

  }