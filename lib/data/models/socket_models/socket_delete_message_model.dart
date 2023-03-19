import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class SocketDeleteMessageModel with Mappable {
  SocketDeleteMessageModel({
    this.author,
    this.conversationId,
    this.uuid,
    this.replyUuid,
  });

  final AuthorModel? author;
  @MappableField(key: 'conversation_id')
  final String? conversationId;
  final String? uuid;
  @MappableField(key: 'reply_uuid')
  final String? replyUuid;
}
