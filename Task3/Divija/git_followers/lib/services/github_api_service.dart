import 'package:http/http.dart' as http;
import 'package:git_followers/env.dart';

class Github {
  final String userName;
  final String url = 'api.github.com';
  static String token = '$Env.bearerToken';

  Github(this.userName);

  Future<http.Response> fetchUser () {
    return http.get(Uri.https(url, 'users/' + userName), headers: {
    "Authorization": "",
    });
    }

    Future<http.Response> fetchFollowing() {
    return http.get(Uri.https(url, 'users/' + userName + '/followers' ), headers: {
      "Authorization": "",

    });

  }
}