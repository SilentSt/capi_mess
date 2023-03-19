import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class DashsContentModel extends CoreModel {
  DashsContentModel({
    required super.status,
    required super.code,
    required super.error,
    this.result = const [],
  });

  final List<DashContentResult> result;
}
