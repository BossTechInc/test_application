import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test_application/home_page.dart';
import 'package:test_application/model_notification.dart';
import 'package:test_application/provider_file_service.dart';
import 'firebase_operations.dart';
import 'news_model.dart';
import 'package:overlay_support/overlay_support.dart';
import 'notification_badge.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ConnectivityProvider(),
        child: HomePage(),
      ),
    ],
      child: OverlaySupport(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage() ,
      ),
    ),
    );

  }
}

class MyHome extends StatefulWidget {
 
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

 late final FirebaseMessaging _messaging;
 late int _totalNotificationCounter;
 PushNotication? _notificationInfo;
 //var now = DateTime.now();

  void registerNotification() async{
     _messaging = FirebaseMessaging.instance;
     await Firebase.initializeApp();

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional:false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized){
        print("User granted permission");

        FirebaseMessaging.onMessage.listen((RemoteMessage message){

          PushNotication notification = PushNotication(
           message.notification!.title as String,
           message.notification!.body as String,
         );
         setState(() {
           _totalNotificationCounter++;
           _notificationInfo = notification;
         });

         if(notification != null){
           showSimpleNotification(
             Text(_notificationInfo!.title),
             leading: 
             NotificationBadge(),
             subtitle: Text(_notificationInfo!.body),
             background: Colors.cyan.shade700,
             duration: Duration(seconds: 2),
           );
         }
        },
       );
      }
      else{
        print("permission denied");
  }
  }

checForInitialMessage() async{
   await Firebase.initializeApp();
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if(initialMessage != null){
     
          PushNotication notification = PushNotication(
           initialMessage.notification!.title as String,
           initialMessage.notification!.body as String,
         );

          setState(() {
           _totalNotificationCounter++;
           _notificationInfo = notification;
         });
    }

  }

@override
  void initState() {

//   when app is is background

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
       PushNotication notification = PushNotication(
           message.notification!.title as String,
           message.notification!.body as String,
         );
         setState(() {
           _totalNotificationCounter++;
           _notificationInfo = notification;
         });
    });

// normal notification in foreground state i.e app is running

   registerNotification();

// when app is in terminated state

checForInitialMessage();

   _totalNotificationCounter = 0;

    super.initState();
  }

 String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  final model = NewsListModel(
      listItemHeadLine: "New News",
      listItemImageUrl: "imageUrl",
      listItemNewsLink: "List Item News Link",
      date :  DateFormat('yyyy-MM-dd').format(DateTime.now()),isBanner: true);


  List<String> testList = [];
  List<NewsListModel> testNewsModel = [NewsListModel(),NewsListModel(),NewsListModel(),NewsListModel(),NewsListModel()];
  //Get Data

   Future<void> retrieveApp() async {
    await FirebaseFirestore.instance.collection('news/politics/news_data').limit(10).where('banner',isEqualTo: true,).get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        testList.add(doc["listItemHeadLine"]);
      });
    });
  }

  void printOnConsole(){
     if(testList.isNotEmpty) {
       for (int i = 0; i < testList.length; i++) {
         print(testList[i]);
       }
     }else{
       print("List is Empty");
     }
  }
  void clearList(){
     testList.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TestApplication"),
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: Text("Add"),
              onPressed: () {
                FirebaseOps.createItem(model);
              },
            ),
            ElevatedButton(onPressed: (){retrieveApp();}, child: Text("Recieve")),

           Text(currentDate),

           Expanded(
             child: ListView.builder(itemCount: testList.length,itemBuilder: (context,index){

                return Text("${testList[index]}");

              }),
           ),
            ElevatedButton(onPressed: (){printOnConsole();}, child: Text("Print")),
            ElevatedButton(onPressed: (){clearList();}, child: Text("Clear")),

          ],
        ),
      );
  }
}
