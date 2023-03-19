import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/auth_service.dart';
import 'package:template/domain/services/upload_service.dart';
import 'package:template/domain/services/user_service.dart';

class ProfileViewModel extends BaseViewModel {
  ProfileViewModel({
    required this.authService,
    required this.userService,
    required this.id,
    required this.uploadService,
  });

  final AuthService authService;
  final UserService userService;
  final UploadService uploadService;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String? id;

  bool isMe = false;
  bool onEdit = false;

  MeResult? user;
  String? imageId;
  Uint8List? image;

  Future<void> onViewModelReady() async {
    setBusy(true);
    await fetchUser();
    setBusy(false);
  }

  Future<void> fetchUser() async {
    if (id == null) {
      user = await authService.me();
      isMe = true;
    } else {
      user = await userService.getById(id);
      isMe = user?.isMe ?? false;
    }
    setupControllers();
    notifyListeners();
  }

  Future<void> updateUser() async {
    if (isMe == false) return;
    String? name;
    String? lastName;
    String? password;
    if (nameController.text.trim().isNotEmpty) {
      name = nameController.text.trim();
    }
    if (lastNameController.text.trim().isNotEmpty) {
      lastName = lastNameController.text.trim();
    }
    if (passwordController.text.trim().isNotEmpty) {
      password = passwordController.text.trim();
    }
    if (name != null || lastName != null || password != null || imageId != null) {
      await authService.patchMe(
        UserPatchDto(
          firstName: name,
          lastName: lastName,
          password: password,
          avatarId: imageId,
        ),
      );
      await fetchUser();
    }
    setupControllers();
    changeEditStatus();
  }

  Future<void> uploadImage() async {
    final res = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (res == null) return;
    image = await res.readAsBytes();
    imageId = await uploadService.uploadMedia(res);
    notifyListeners();
  }

  void setupControllers() {
    nameController.text = user?.firstName ?? '';
    lastNameController.text = user?.lastName ?? '';
  }

  void changeEditStatus() {
    onEdit = !onEdit;
    notifyListeners();
  }
}
