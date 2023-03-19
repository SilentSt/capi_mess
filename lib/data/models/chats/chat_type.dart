import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.mapper.g.dart';

@MappableClass()
class ChatType with Mappable {
  ChatType({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;
}
