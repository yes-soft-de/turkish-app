import 'dart:convert';

import 'package:inject/inject.dart';
import 'package:shared_preferences/shared_preferences.dart';

@provide
class ProfileSharedPreferencesHelper {
  Future<void> setUserName(String username) async {
    var prefsHelper = await SharedPreferences.getInstance();
    return prefsHelper.setString('profile_username', username);
  }

  Future<void> setUserLocation(String location) async {
    var prefsHelper = await SharedPreferences.getInstance();
    return prefsHelper.setString('profile_location', location);
  }

  Future<void> setUserImage(String image) async {
    var prefsHelper = await SharedPreferences.getInstance();
    return prefsHelper.setString('profile_image', image);
  }

  Future<void> setUserCover(String cover) async {
    var prefsHelper = await SharedPreferences.getInstance();
    return prefsHelper.setString('profile_cover', cover);
  }

  Future<void> setUserStory(String story) async {
    var prefsHelper = await SharedPreferences.getInstance();
    return prefsHelper.setString('profile_story', story);
  }

  Future<void> setEndUserTerms(bool seen) async {
    var prefsHelper = await SharedPreferences.getInstance();
    return prefsHelper.setBool('EULA', seen);
  }

  Future<bool> getEndUserTermsState() async {
    var prefsHelper = await SharedPreferences.getInstance();
    return prefsHelper.getBool('EULA');
  }

  Future<String> getUsername() async {
    var prefsHelper = await SharedPreferences.getInstance();
    return prefsHelper.getString('profile_username');
  }

  Future<String> getUserLocation() async {
    var prefsHelper = await SharedPreferences.getInstance();
    return prefsHelper.getString('profile_location');
  }

  Future<String> getUserStory() async {
    var prefsHelper = await SharedPreferences.getInstance();
    return prefsHelper.getString('profile_story');
  }

  Future<String> getImage() async {
    var prefsHelper = await SharedPreferences.getInstance();
    return prefsHelper.getString('profile_image');
  }

  Future<String> getCoverImage() async {
    var prefsHelper = await SharedPreferences.getInstance();
    return prefsHelper.getString('profile_cover');
  }

  Future<void> deleteProfile() async {
    var prefsHelper = await SharedPreferences.getInstance();
    prefsHelper.remove('profile_username');
    prefsHelper.remove('profile_image');
  }

  Future<void> cacheBlackList(List<String> blackList) async {
    if (blackList == null) {
      return null;
    }
    if (blackList.isEmpty) {
      return null;
    }
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('Black List', jsonEncode(blackList));
  }

  Future<List<String>> getBlackList() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var blackListJson = _prefs.getString('Black List');
    if (blackListJson == null) return null;
    if (blackListJson.length < 5) return null;

    var blackList = <String>[];

    var cached = jsonDecode(blackListJson);
    if (cached is List) {
      cached.forEach((element) {
        blackList.add(element);
      });
    }

    return blackList;
  }
}
