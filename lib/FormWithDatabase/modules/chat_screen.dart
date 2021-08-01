import 'package:flutter/material.dart';
class ChatScreen extends StatelessWidget {
  //const Post-Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(
            value: 20,
          ),
        ),
      ),
    );
  }
}
