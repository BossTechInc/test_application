class NewsListModel {
  String? bannerImageUrl;
  String? bannerHeadline;
  String? bannerNewsLink;
  String? listItemImageUrl;
  String? listItemHeadLine;
  String? listItemNewsLink;
  String? id;

  NewsListModel({this.bannerImageUrl, this.bannerHeadline, this.bannerNewsLink,
      this.listItemImageUrl, this.listItemHeadLine, this.listItemNewsLink,this.id});


  Map<String,dynamic> toJson() => {

    'bannerImageUrl' : bannerImageUrl,
    'bannerHeadline' : bannerHeadline,
    'bannerNewsLink' : bannerNewsLink,
    'listItemImageUrl' : listItemImageUrl,
    'listItemHeadLine' : listItemHeadLine,
    'listItemNewsLink' : listItemNewsLink,
    'id' : id,
  };

}

