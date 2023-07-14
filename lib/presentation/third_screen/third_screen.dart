import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:suitmedia_test/domain/model/user.dart';
import 'package:suitmedia_test/presentation/third_screen/third_screen_viewmodel.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late ThirdScreenViewModel viewModel;
  late List<User> data;
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  var page = 1;

  @override
  void initState() {
    viewModel = Provider.of<ThirdScreenViewModel>(context, listen: false);
    data = [];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllUsers();
    });
    super.initState();
  }

  void getAllUsers() async {
    data.isEmpty ? data = (await viewModel.getAllUsers(page, 10))! : data = data;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThirdScreenViewModel>(
      builder: (_, model, child) {
        return WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Third Screen",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF04021D),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: model.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SmartRefresher(
                    enablePullUp: true,
                    enablePullDown: true,
                    controller: _refreshController,
                    onRefresh: _handleRefresh,

                    onLoading: _handleLoadMore,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context, "${data[index].firstName} ${data[index].lastName}");
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(data[index].avatar),
                                      radius: 30,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${data[index].firstName} ${data[index].lastName}",
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                        Text(
                                          data[index].email,
                                          style: const TextStyle(
                                            color: Color(0xFF686777),
                                            fontSize: 10,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(color: Colors.grey, thickness: 1)
                          ],
                        );
                      },
                    ),
                  ),
                ),
          ),
        );
      },
    );
  }

  Future<void> _handleRefresh() {
    return Future<void>.delayed(const Duration(seconds: 1), () {
      setState(() {
        getAllUsers();});
    });
  }

  void _handleLoadMore() async {
    var newData = await viewModel.getAllUsers(++page, 10) as List<User>;
    if (newData.isEmpty) {
      _refreshController.loadNoData();
      return;
    }
    data.addAll(newData);
    _refreshController.loadComplete();
  }
}

