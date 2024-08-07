import 'package:github_follower_fetcher/models/followers.dart';
import 'package:github_follower_fetcher/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GitHubService {
  Future<User> fetchUserProfile(String username) async {
    final response = await http.get(Uri.parse('https://api.github.com/users/$username'));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user profile');
    }
  }

  Future<List<Follower>> fetchFollowers(String username) async {
    final response = await http.get(Uri.parse('https://api.github.com/users/$username/followers'));

    if (response.statusCode == 200) {
      final List followersJson = json.decode(response.body);
      return followersJson.map((json) => Follower.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load followers');
    }
  }
}
