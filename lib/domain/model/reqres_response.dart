import 'package:suitmedia_test/domain/model/user.dart';

class ReqresResponse {
  int page = 0;
  int perPage = 0;
  int total = 0;
  int totalPages = 0;
  List<User> data = [];

  ReqresResponse({required this.page, required this.perPage, required this.total, required this.totalPages, required this.data});

  ReqresResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <User>[];
      json['data'].forEach((v) {
        data.add(User.fromJson(v));
      });
    }
  }
}