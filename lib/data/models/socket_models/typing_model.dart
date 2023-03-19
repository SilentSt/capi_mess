import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.mapper.g.dart';
import 'package:template/data/models/user/author_model.dart';

@MappableClass()
class TypingModel with Mappable {
  TypingModel({
    this.author,
    this.conversationId,
    this.createdAt,
  });

  final AuthorModel? author;
  @MappableField(key: 'conversation_id')
  final String? conversationId;
  @MappableField(key: 'created_at')
  final DateTime? createdAt;
}
