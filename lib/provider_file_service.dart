

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectivityProvider with ChangeNotifier{

Connectivity _connectivity = new Connectivity();

bool _isOnline = false;

bool get isOnline => _isOnline;

startMonitoring() async {
  await initConnectivity();
  _connectivity.onConnectivityChanged.listen((event) async{
    if(event == ConnectivityResult.none){
      _isOnline = false;
      notifyListeners();
    }
    else{
      await updateConnectionStatus().then((bool? isConnected){
        _isOnline = isConnected!;
        notifyListeners();
      });
    }
   });

}

Future<void> initConnectivity() async{
  try{
    var status = await _connectivity.checkConnectivity();

    if(status == ConnectivityResult.none){
      _isOnline = false;
      notifyListeners();
    }
    else{
      _isOnline = true;
      notifyListeners();
    }
  }on PlatformException catch(e){
    print(e.toString());
  }
}

  Future<bool?> updateConnectionStatus() async{
    bool? isCoonected;
    try{
      final List<InternetAddress> result = await InternetAddress.lookup('google.com');
      if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
        isCoonected = true;
      }
    }on SocketException catch(_){
        isCoonected = false;
    }
    return isCoonected;
  }
}