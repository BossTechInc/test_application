class NewsListModel {
  String? bannerImageUrl;
  String? bannerHeadline;
  String? bannerNewsLink;
  String? listItemImageUrl;
  String? listItemHeadLine;
  String? listItemNewsLink;
  String? id;
  String? date;

  NewsListModel({this.bannerImageUrl, this.bannerHeadline, this.bannerNewsLink,
      this.listItemImageUrl, this.listItemHeadLine, this.listItemNewsLink,this.id, this.date});


  Map<String,dynamic> toJson() => {

    'bannerImageUrl' : bannerImageUrl,
    'bannerHeadline' : bannerHeadline,
    'bannerNewsLink' : bannerNewsLink,
    'listItemImageUrl' : listItemImageUrl,
    'listItemHeadLine' : listItemHeadLine,
    'listItemNewsLink' : listItemNewsLink,
    'id' : id,
    'date' : date,
  };

}

