import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.mapper.g.dart';

@MappableClass()
class CoreStatus with Mappable {
  CoreStatus({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;
}
