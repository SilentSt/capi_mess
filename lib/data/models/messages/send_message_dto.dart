import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/messages/patch_message_dto.dart';

@MappableClass()
class SendMessageDto extends PatchMessageDto {
  @MappableField(key: 'reply_uuid')
  final String? replyUuid;
  final List<String> documents;

  SendMessageDto({
    this.replyUuid,
    this.documents = const [],
    super.text,
  });
}
