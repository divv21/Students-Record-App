import 'package:flutter/material.dart';
import 'package:github_follower_fetcher/providers/github_provider.dart';
import 'package:github_follower_fetcher/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GitHubProvider(),
      child: MaterialApp(
        title: 'GitHub Follower Fetcher',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
