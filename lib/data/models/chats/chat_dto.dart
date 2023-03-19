import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class ChatDto with Mappable {
  ChatDto({
    required this.type,
    this.companion,
    this.chat,
  });

  final String type;
  final CompanionModel? companion;
  final ChatCreator? chat;
}
