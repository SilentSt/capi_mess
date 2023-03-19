// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_chats_ds.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RemoteChatsDataSource extends RemoteChatsDataSource {
  _$RemoteChatsDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RemoteChatsDataSource;

  @override
  Future<Response<ChatsModel>> fetch() {
    final Uri $url = Uri.parse('chats');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ChatsModel, ChatsModel>($request);
  }

  @override
  Future<Response<CreateChatsModel>> add(ChatDto dto) {
    final Uri $url = Uri.parse('chats');
    final $body = dto;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CreateChatsModel, CreateChatsModel>($request);
  }
}
