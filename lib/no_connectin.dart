
import 'package:flutter/material.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,title :Text('No Connection', ),backgroundColor: Colors.white,centerTitle: true,),
      body: Center(child: Text('Check internet connection and try again'),),    
    );
  }
}