import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/user_service.dart';

class UsersViewModel extends BaseViewModel {
  UsersViewModel({required this.userService});

  final UserService userService;
  final controller = TextEditingController();

  List<UserResult> get users {
    if (controller.text.trim().isEmpty) return _users;
    return _users
        .where((element) =>
            (element.firstName ?? '').contains(controller.text) ||
            (element.lastName ?? '').contains(controller.text) ||
            (element.login ?? '').contains(controller.text))
        .toList();
  }

  List<UserResult> _users = [];

  Future<void> onViewModelReady() async {
    setBusy(true);
    _users = await userService.fetch();
    setBusy(false);
    controller.addListener(() {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
