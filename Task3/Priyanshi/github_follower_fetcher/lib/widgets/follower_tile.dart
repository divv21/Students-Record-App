import 'package:flutter/material.dart';
import 'package:github_follower_fetcher/models/followers.dart';
import 'package:github_follower_fetcher/providers/github_provider.dart';
import 'package:github_follower_fetcher/screens/followers_screen.dart';
import 'package:provider/provider.dart';

class FollowerTile extends StatelessWidget {
  final Follower follower;

  FollowerTile({required this.follower});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(follower.avatarUrl),
      ),
      title: Text(
        follower.login,
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
      trailing: Icon(Icons.arrow_forward, color: Colors.blueAccent),
      onTap: () async {
        final githubProvider =
            Provider.of<GitHubProvider>(context, listen: false);
        final success = await Future.delayed(Duration(milliseconds: 500),
            () => githubProvider.fetchFollowers(follower.login));

        if (success) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FollowersScreen(
                username: follower.login,
                followers: githubProvider.followers,
                userProfile: githubProvider.userProfile!,
              ),
            ),
          );
        }
      },
    );
  }
}
