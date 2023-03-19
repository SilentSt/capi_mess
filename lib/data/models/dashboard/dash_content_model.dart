import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class DashContentModel extends CoreModel {
  DashContentModel({
    required super.status,
    required super.code,
    required super.error,
    this.result,
  });

  final DashContentResult? result;
}
