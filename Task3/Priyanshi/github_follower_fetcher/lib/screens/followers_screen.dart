import 'package:flutter/material.dart';
import 'package:github_follower_fetcher/models/followers.dart';
import 'package:github_follower_fetcher/models/user.dart';
import 'package:github_follower_fetcher/widgets/follower_tile.dart';

class FollowersScreen extends StatelessWidget {
  final String username;
  final List<Follower> followers;
  final User userProfile;

  FollowersScreen({
    required this.username,
    required this.followers,
    required this.userProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              _buildUserProfile(),
              _buildFollowersList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.popUntil(
                  context, ModalRoute.withName(Navigator.defaultRouteName));
            },
          ),
          Text(
            username,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 48), // to balance the back button width
        ],
      ),
    );
  }

  Widget _buildUserProfile() {
    return Column(
      children: [
        CircleAvatar(
          radius: 90,
          backgroundImage: NetworkImage(userProfile.avatarUrl),
        ),
        SizedBox(height: 10),
        Text(
          userProfile.name.isNotEmpty ? userProfile.name : username,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          '@$username',
          style: TextStyle(
              fontSize: 18, color: Colors.white70, fontWeight: FontWeight.w400),
        ),
        Text(
          '${followers.length} followers',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildFollowersList() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView.separated(
          itemCount: followers.length,
          separatorBuilder: (context, index) => SizedBox(height: 1),
          itemBuilder: (context, index) {
            final follower = followers[index];
            return FollowerTile(follower: follower);
          },
        ),
      ),
    );
  }
}
