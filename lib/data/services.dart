import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:suitmedia_test/domain/model/user.dart';

class Services {
   Future<List<User>?> getAllUsers({String page = "1", String perPage = "10"}) async {
    try {
      var response = await Dio().get('https://reqres.in/api/users?page=$page&per_page=$perPage');

      if (response.statusCode == 200) {
        return (response.data['data'] as List).map((e) => User.fromJson(e)).toList();
      }

      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}