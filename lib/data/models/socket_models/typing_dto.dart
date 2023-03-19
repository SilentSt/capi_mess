import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.mapper.g.dart';

@MappableClass()
class TypingDto with Mappable {
  TypingDto({
    this.conversationId,
  });

  @MappableField(key: 'conversation_id')
  final String? conversationId;
}
