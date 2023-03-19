import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.mapper.g.dart';

@MappableClass()
class StatusModel with Mappable {
  StatusModel({
    this.id,
    this.title,
  });
  final int? id;
  final String? title;
}
