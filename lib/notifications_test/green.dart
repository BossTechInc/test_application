import 'package:flutter/material.dart';

class Green extends StatelessWidget {
  const Green({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(child: Text("Green"),),
    );
  }
}