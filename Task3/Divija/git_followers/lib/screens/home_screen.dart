import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();

  void _getUser() {
    if ( _controller.text == '') {

    }
    else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.limeAccent,
      appBar: AppBar(
        title: Text("Github Followers"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Github username",
                hintStyle: TextStyle(
                  color: Colors.black
                ),
                filled: true,
                fillColor: Colors.grey,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: ElevatedButton(
                child: Text(
                  "Get your followers now",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 60),
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  _getUser();
                },

              )
            ),
          )
        ],
      ),
    );
  }
}
