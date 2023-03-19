import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class ChatCreator with Mappable {
  ChatCreator({required this.title});

  final String title;
}
