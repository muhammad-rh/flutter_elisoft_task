class ArticlesModel {
  String? uuid;
  String? title;
  String? content;
  String? image;
  int? views;

  ArticlesModel({
    this.uuid,
    this.title,
    this.content,
    this.image,
    this.views,
  });

  ArticlesModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    views = json['views'];
  }
}
