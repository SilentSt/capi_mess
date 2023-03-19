import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class SocketMessageModel extends MessageResult {
  SocketMessageModel({
    super.uuid,
    super.updatedAt,
    super.threadCount,
    super.text,
    super.replyUuid,
    required super.createdAt,
    super.conversationId,
    super.authorId,
    super.author,
    super.parentId,
    super.documents,
  });
}
