import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:template/data/data_sources/auth/local_auth_ds.dart';
import 'package:template/data/data_sources/auth/local_auth_ds_impl.dart';

@immutable
class AuthInterceptor implements RequestInterceptor {
  const AuthInterceptor(this.localAuthDs);
  final LocalAuthDataSource localAuthDs;

  @override
  Future<Request> onRequest(Request request) async {
    if (localAuthDs.currentToken.value != null &&
        LocalAuthDataSourceImpl.currentState.value == AuthState.authorized) {
      final token = localAuthDs.currentToken.value;
      return applyHeaders(
        request,
        {
          'Authorization': 'Bearer $token',
          ...request.headers,
        },
      );
    } else {
      return request;
    }
  }
}
