import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_operations.dart';
import 'news_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  final model = NewsListModel(
      bannerImageUrl: "https://unsplash.com/photos/BU7fbduIEwk",
      bannerHeadline: "Headline",
      bannerNewsLink: "BannernewsURL",
      listItemHeadLine: "Newsheadling",
      listItemImageUrl: "imageUrl",
      listItemNewsLink: "List Item News Link");

  List<String> testList = [];

   Future<void> retrieveApp() async {
    await FirebaseFirestore.instance.collection('news').get().then((QuerySnapshot querySnapshot) {
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
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
           Expanded(
             child: ListView.builder(itemCount: testList.length,itemBuilder: (context,index){
                return Text("Item ${testList[index]}");
              }),
           ),
            ElevatedButton(onPressed: (){printOnConsole();}, child: Text("Print")),
            ElevatedButton(onPressed: (){clearList();}, child: Text("Clear")),

          ],
        ),
      ),
    );
  }
}
