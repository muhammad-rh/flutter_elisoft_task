class ResponseResultArticleModel {
  int? code;
  bool? status;
  String? message;
  List<ArticlesModel>? articles;

  ResponseResultArticleModel(
      {this.code, this.status, this.message, this.articles});

  ResponseResultArticleModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['articles'] != null) {
      articles = <ArticlesModel>[];
      json['articles'].forEach((v) {
        articles!.add(ArticlesModel.fromJson(v));
      });
    }
  }
}

class ArticlesModel {
  String? uuid;
  String? title;
  String? content;
  String? image;
  int? views;
  Created? created;
  User? user;

  ArticlesModel(
      {this.uuid,
      this.title,
      this.content,
      this.image,
      this.views,
      this.created,
      this.user});

  ArticlesModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    views = json['views'];
    created =
        json['created'] != null ? Created.fromJson(json['created']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class Created {
  DateTime? date;
  int? timezoneType;
  String? timezone;

  Created({this.date, this.timezoneType, this.timezone});

  Created.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    timezoneType = json['timezone_type'];
    timezone = json['timezone'];
  }
}

class User {
  String? name;
  String? email;
  String? phoneNumber;
  Created? created;
  String? uuid;

  User({this.name, this.email, this.phoneNumber, this.created, this.uuid});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    created =
        json['created'] != null ? Created.fromJson(json['created']) : null;
    uuid = json['uuid'];
  }
}
