import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class MessageResult with Mappable {
  MessageResult({
    required this.createdAt,
    this.updatedAt,
    this.uuid,
    this.authorId,
    this.conversationId,
    this.replyUuid,
    this.text,
    this.threadCount,
    this.author,
    this.parentId,
    this.documents = const [],
  });

  @MappableField(key: 'created_at')
  final DateTime createdAt;
  @MappableField(key: 'updated_at')
  final DateTime? updatedAt;
  final String? uuid;
  @MappableField(key: 'author_id')
  final String? authorId;
  @MappableField(key: 'conversation_id')
  final String? conversationId;
  @MappableField(key: 'reply_uuid')
  final String? replyUuid;
  final String? text;
  @MappableField(key: 'thread_count')
  final int? threadCount;
  final AuthorModel? author;
  final String? parentId;
  final List<DocumentModel> documents;
  List<DocumentStats> documentStats = [];

}
