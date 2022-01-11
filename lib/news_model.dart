class NewsListModel {
  String? listItemImageUrl;
  String? listItemHeadLine;
  String? listItemNewsLink;
  String? id;
  String? date;
  bool? isBanner;

  NewsListModel({this.isBanner,
      this.listItemImageUrl, this.listItemHeadLine, this.listItemNewsLink,this.id, this.date});

  Map<String,dynamic> toJson() => {

    'banner' : isBanner,
    'listItemImageUrl' : listItemImageUrl,
    'listItemHeadLine' : listItemHeadLine,
    'listItemNewsLink' : listItemNewsLink,
    'id' : id,
    'date' : date,
  };

}

