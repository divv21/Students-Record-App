import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:github_follower_fetcher/models/followers.dart';
import 'package:github_follower_fetcher/models/user.dart';

class GitHubProvider with ChangeNotifier {
  bool isLoading = false;
  String errorMessage = '';
  List<Follower> followers = [];
  User? userProfile;

  Future<bool> fetchFollowers(String username) async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      final followersResponse = await Dio().get('https://api.github.com/users/$username/followers');
      final profileResponse = await Dio().get('https://api.github.com/users/$username');

      if (followersResponse.statusCode == 200 && profileResponse.statusCode == 200) {
        followers = (followersResponse.data as List).map((e) => Follower.fromJson(e)).toList();
        userProfile = User.fromJson(profileResponse.data);
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        errorMessage = 'Failed to load followers';
      }
    } catch (e) {
      errorMessage = 'An error occurred';
    }

    isLoading = false;
    notifyListeners();
    return false;
  }
}
