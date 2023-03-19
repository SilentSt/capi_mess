import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/data/models/models.dart';

import 'local_auth_ds.dart';

class LocalAuthDataSourceImpl extends LocalAuthDataSource {
  static final ValueNotifier<AuthState> currentState = ValueNotifier(AuthState.none);

  @override
  Future<void> init() async {
    await restoreLoginDto();
    await restoreSession();
  }

  @override
  Future<void> storeSession(String token) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString(sessionKey, token);
    currentToken.value = token;
    currentState.value = AuthState.authorized;
    notifyListeners();
  }

  @override
  Future<void> storeLoginDto(SignInDto dto) async {
    final storage = await SharedPreferences.getInstance();
    final json = dto.toString();
    await storage.setString(loginDtoStorageKey, json);
    currentLoginDto.value = dto;
    currentLoginDto.notifyListeners();
  }

  @override
  Future<void> restoreSession() async {
    final storage = await SharedPreferences.getInstance();
    final json = storage.getString(sessionKey);
    if (json == null) {
      return;
    } else {
      currentToken.value = json;
      currentState.value = AuthState.authorized;
      notifyListeners();
    }
  }

  @override
  Future<void> restoreLoginDto() async {
    final storage = await SharedPreferences.getInstance();
    final json = storage.getString(loginDtoStorageKey);
    if (json == null) return;
    try {
      currentLoginDto.value = Mapper.fromJson<SignInDto>(json);
      currentLoginDto.notifyListeners();
    } catch (_) {
      return;
    }
  }

  @override
  Future<void> logout() async {
    final storage = await SharedPreferences.getInstance();
    await storage.clear();
    currentState.value = AuthState.none;
    notifyListeners();
  }

  @override
  void dispose() {
    currentState.dispose();
    super.dispose();
  }
}
