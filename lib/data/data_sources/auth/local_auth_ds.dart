import 'package:flutter/material.dart';
import 'package:template/data/models/models.dart';

enum AuthState {
  authorized,
  none,
}

abstract class LocalAuthDataSource extends ChangeNotifier {
  final sessionKey = 'session_key';
  final loginDtoStorageKey = 'login_key';

  final ValueNotifier<String?> currentToken = ValueNotifier(null);
  final ValueNotifier<SignInDto?> currentLoginDto = ValueNotifier(null);

  Future<void> init();

  Future<void> storeSession(String token);

  Future<void> storeLoginDto(SignInDto dto);

  Future<void> restoreSession();

  Future<void> restoreLoginDto();

  Future<void> logout();

  @override
  void dispose() {
    currentToken.dispose();
    currentLoginDto.dispose();
    super.dispose();
  }
}
