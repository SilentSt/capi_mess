// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_documents_ds.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RemoteDocumentsDataSource extends RemoteDocumentsDataSource {
  _$RemoteDocumentsDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RemoteDocumentsDataSource;

  @override
  Future<Response<DocumentStats>> getById(String uuid) {
    final Uri $url = Uri.parse('documents/${uuid}/stats');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<DocumentStats, DocumentStats>($request);
  }
}
