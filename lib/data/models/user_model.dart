class ResponseResultUserModel {
  int? code;
  bool? status;
  String? message;
  UserModel? user;

  ResponseResultUserModel({this.code, this.status, this.message, this.user});

  ResponseResultUserModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
}

class UserModel {
  String? name;
  String? email;
  String? phoneNumber;
  Created? created;
  String? uuid;

  UserModel({this.name, this.email, this.phoneNumber, this.created, this.uuid});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    created =
        json['created'] != null ? Created.fromJson(json['created']) : null;
    uuid = json['uuid'];
  }
}

class Created {
  String? date;
  int? timezoneType;
  String? timezone;

  Created({this.date, this.timezoneType, this.timezone});

  Created.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    timezoneType = json['timezone_type'];
    timezone = json['timezone'];
  }
}
