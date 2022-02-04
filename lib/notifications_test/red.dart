import 'package:flutter/material.dart';

class Red extends StatelessWidget {
  const Red({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(child: Text("Red"),),
    );
  }
}