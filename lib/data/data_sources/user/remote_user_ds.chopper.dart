// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_user_ds.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RemoteUserDataSource extends RemoteUserDataSource {
  _$RemoteUserDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RemoteUserDataSource;

  @override
  Future<Response<MeModel>> getById(String uuid) {
    final Uri $url = Uri.parse('users/${uuid}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<MeModel, MeModel>($request);
  }

  @override
  Future<Response<UsersModel>> fetch() {
    final Uri $url = Uri.parse('users');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UsersModel, UsersModel>($request);
  }
}
