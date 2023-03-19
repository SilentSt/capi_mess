// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_messages_ds.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RemoteMessagesDataSource extends RemoteMessagesDataSource {
  _$RemoteMessagesDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RemoteMessagesDataSource;

  @override
  Future<Response<MessagesModel>> fetch({
    required String chatId,
    int limit = 20,
    int offset = 0,
  }) {
    final Uri $url = Uri.parse('chats/${chatId}/messages');
    final Map<String, dynamic> $params = <String, dynamic>{
      'limit': limit,
      'offset': offset,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<MessagesModel, MessagesModel>($request);
  }

  @override
  Future<Response<MessageModel>> send({
    required String chatId,
    required SendMessageDto dto,
  }) {
    final Uri $url = Uri.parse('chats/${chatId}/messages');
    final $body = dto;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<MessageModel, MessageModel>($request);
  }

  @override
  Future<Response<MessagesModel>> fetchThread({
    required String chatId,
    required String messageId,
  }) {
    final Uri $url = Uri.parse('chats/${chatId}/messages/${messageId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<MessagesModel, MessagesModel>($request);
  }

  @override
  Future<Response<DeletedMessageModel>> delete({
    required String chatId,
    required String messageId,
  }) {
    final Uri $url = Uri.parse('chats/${chatId}/messages/${messageId}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<DeletedMessageModel, DeletedMessageModel>($request);
  }

  @override
  Future<Response<MessageModel>> patchMessage({
    required String chatId,
    required String messageId,
    required PatchMessageDto dto,
  }) {
    final Uri $url = Uri.parse('chats/${chatId}/messages/${messageId}');
    final $body = dto;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<MessageModel, MessageModel>($request);
  }
}
