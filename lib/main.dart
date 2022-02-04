import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test_application/home_page.dart';
import 'package:test_application/model_notification.dart';
import 'package:test_application/my_theme.dart';
import 'package:test_application/notifications_test/green.dart';
import 'package:test_application/notifications_test/red.dart';
import 'package:test_application/notifications_test/services/local_notification_service.dart';
import 'package:test_application/provider_file_service.dart';
import 'package:test_application/theme_change_switch.dart';
import 'firebase_operations.dart';
import 'my_theme.dart';
import 'my_theme.dart';
import 'news_model.dart';
import 'package:overlay_support/overlay_support.dart';
import 'notification_badge.dart';

<<<<<<< HEAD
Future<void> backgroundHandler(RemoteMessage message) async{
  print(message.data.toString());
  print(message.notification!.title);
}
=======
>>>>>>> 60ca2e470d4ee58b95b975c4bcb6f7d6d443e318
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
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
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
         child: HomePage(),
        builder:(context, _){
          final themeProvider = Provider.of<ThemeProvider>(context);
           return OverlaySupport(
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: themeProvider.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: HomePage() ,
        routes: {
          "red":(_)=> const Red(),
          "green":(_)=> const Green(),
        },
      ),
    );
          
        }
       
      ),
    ],
    
   
    );

  }
}

class MyHome extends StatefulWidget {
 
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

<<<<<<< HEAD

 
=======
 late final FirebaseMessaging _messaging;
 late int _totalNotificationCounter;
 PushNotication? _notificationInfo;
 //var now = DateTime.now();
>>>>>>> 60ca2e470d4ee58b95b975c4bcb6f7d6d443e318



@override
  void initState() {
    LocalNotificationService.initialize(context);

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if(message != null){
        final routeFromMessage = message.data['route'];
      }
    });

// foreground 


  FirebaseMessaging.onMessage.listen((message){
    print(message.notification!.body);
    print(message.notification!.title);


    LocalNotificationService.display(message);


<<<<<<< HEAD
  });

  
//   when app is is background 

  FirebaseMessaging.onMessageOpenedApp.listen((message){
     
   final routeFromMessage = message.data["route"];
   print(routeFromMessage);

   Navigator.of(context).pushNamed(routeFromMessage);

  });

  
=======
// normal notification in foreground state i.e app is running
>>>>>>> 60ca2e470d4ee58b95b975c4bcb6f7d6d443e318





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
          actions: [
            ChangeThemeButtonWidget(),
          ],
         
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
