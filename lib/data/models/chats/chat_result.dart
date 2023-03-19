import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/chats/chat_model.dart';
import 'package:template/data/models/chats/chat_type.dart';
import 'package:template/data/models/models.mapper.g.dart';
import 'package:template/data/models/user/author_model.dart';

@MappableClass()
class ChatResult with Mappable {
  ChatResult({
    this.createdAt,
    this.updatedAt,
    this.uuid,
    this.typeId,
    this.companion,
    this.chatId,
    this.chatType,
    this.chat,
  });

  @MappableField(key: 'created_at')
  final DateTime? createdAt;
  @MappableField(key: 'updated_at')
  final DateTime? updatedAt;
  final String? uuid;
  @MappableField(key: 'type_id')
  final int? typeId;
  final AuthorModel? companion;
  @MappableField(key: 'chat_id')
  final String? chatId;
  @MappableField(key: 'chat_type')
  final ChatType? chatType;
  final ChatModel? chat;
}
