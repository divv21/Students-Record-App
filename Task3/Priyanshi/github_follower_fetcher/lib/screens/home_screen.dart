import 'package:flutter/material.dart';
import 'package:github_follower_fetcher/providers/github_provider.dart';
import 'package:provider/provider.dart';
import 'followers_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final githubProvider = Provider.of<GitHubProvider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'GitHub Follower Fetcher',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 48.0),
              _buildTextField(),
              SizedBox(height: 24.0),
              _buildFetchButton(githubProvider),
              SizedBox(height: 24.0),
              if (githubProvider.isLoading)
                Center(child: CircularProgressIndicator()),
              if (githubProvider.errorMessage.isNotEmpty)
                Center(
                  child: Text(
                    githubProvider.errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: _controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        hintText: 'Enter GitHub username',
        hintStyle: TextStyle(color: Colors.white70),
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildFetchButton(GitHubProvider githubProvider) {
    return ElevatedButton(
      onPressed: () async {
        final username = _controller.text.trim();
        if (username.isEmpty) return;

        final success = await githubProvider.fetchFollowers(username);
        if (success) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FollowersScreen(
                username: username,
                followers: githubProvider.followers,
                userProfile: githubProvider.userProfile!,
              ),
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      child: Text('Fetch Followers'),
    );
  }
}
