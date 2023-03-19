import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/chats/status_model.dart';

@MappableClass()
class ChatModel {
  ChatModel({
    this.status,
    this.createAt,
    this.updatedAt,
    this.uuid,
    this.documentId,
    this.title,
    this.statusId,
    this.document,
    this.conversation = const [],
  });

  final StatusModel? status;
  @MappableField(key: 'created_at')
  final DateTime? createAt;
  @MappableField(key: 'updated_at')
  final DateTime? updatedAt;
  final String? uuid;
  @MappableField(key: 'document_id')
  final String? documentId;
  final String? title;
  @MappableField(key: 'status_id')
  final String? statusId;
  final String? document;
  final List<String> conversation;
}
