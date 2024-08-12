/**import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:git_followers/models/followers_model.dart';
import 'package:git_followers/services/github_api_service.dart';
import 'package:git_followers/providers/follower_provider.dart';
import 'package:git_followers/screens/followers_list_screen.dart';

class FollowersListItem extends StatelessWidget {
  const FollowersListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(users![index].avatar_url),
      ),
    );
  }
}**/
