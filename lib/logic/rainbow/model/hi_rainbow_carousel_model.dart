class HiRainBowCarouselModel {
  List<NewsList>? newsList;

  HiRainBowCarouselModel({this.newsList});

  HiRainBowCarouselModel.fromJson(Map<String, dynamic> json) {
    if (json['newsList'] != null) {
      newsList = <NewsList>[];
      json['newsList'].forEach((v) {
        newsList!.add(new NewsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newsList != null) {
      data['newsList'] = this.newsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsList {
  String? news;

  NewsList({this.news});

  NewsList.fromJson(Map<String, dynamic> json) {
    news = json['news'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news'] = this.news;
    return data;
  }
}
