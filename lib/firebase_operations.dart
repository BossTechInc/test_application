import 'package:cloud_firestore/cloud_firestore.dart';

import 'news_model.dart';

class FirebaseOps {

  static Future<String> createItem(NewsListModel newsListModel) async {
    final docToCreate = FirebaseFirestore.instance.collection('news').doc();
    newsListModel.id = docToCreate.id;
    await docToCreate.set(newsListModel.toJson());

    return docToCreate.id;
  }

}
