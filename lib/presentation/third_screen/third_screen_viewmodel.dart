import 'dart:developer';

import 'package:suitmedia_test/data/services.dart';
import 'package:suitmedia_test/domain/model/user.dart';
import 'package:suitmedia_test/presentation/loading_viewmodel.dart';

class ThirdScreenViewModel extends LoadingViewModel {
  final Services services;

  ThirdScreenViewModel({required this.services});

  Future<List<User>?> getAllUsers(int page, int perPage) async {
    isLoading = true;
    List<User>? users = [];
    try {
      users = await services.getAllUsers(page: "$page", perPage: "$perPage");
      isLoading = false;
    } catch (e) {
      log("Exception on ThirdScreenViewModel: $e");
      isLoading = false;
    }

    return users;
  }

}