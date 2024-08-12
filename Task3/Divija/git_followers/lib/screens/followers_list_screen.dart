import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:git_followers/models/followers_model.dart';
import 'package:git_followers/services/github_api_service.dart';
import 'package:git_followers/providers/follower_provider.dart';

class FollowersList extends StatefulWidget {



  @override
  State<FollowersList> createState() => _FollowersListState();
}

class _FollowersListState extends State<FollowersList> {
  FollowersList? user;
  List<FollowersList>? users;

  @override
  Widget build(BuildContext context) {

    setState(() {
      user = Provider.of<UserProvider>(context, listen: false).getUser() as FollowersList?;

      Github(user!.login).fetchFollowing().then((following) {
        Iterable list = json.decode(following.body);
        setState(() {
          users = list.map((model) => User.fromJson(model)).cast<FollowersList>().toList();
        });
      });
    });




    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 600,
                  child:
                  users != null ?
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: users!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(users![index].avatar_url),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text(users![index].login.length > 20 ? users![index].login.substring(0, 15) : users![index].login, style: TextStyle(fontSize: 20, color: Colors.grey[700]),),
                              ],
                            ),
                            Text('Followers', style: TextStyle(color: Colors.blue),)
                          ],
                        ),
                      );
                    },
                  ) :
                  Container(child: Align(child: Text('Data is loading ...'))),
                )
              ]),
            )
          ],
        ),
      ),
    );

  }
}
