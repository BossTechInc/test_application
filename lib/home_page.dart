
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/main.dart';
import 'package:test_application/no_connectin.dart';
import 'package:test_application/provider_file_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    
    super.initState();
  Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }
  @override
  Widget build(BuildContext context) {
    return PageUi();
  }
}

Widget PageUi(){
  return Consumer<ConnectivityProvider> (
    builder: (context, model, child) {

      return model.isOnline ? MyHome() : NoConnection();
     
  }
  );
}