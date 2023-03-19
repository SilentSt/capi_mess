import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class CoreModel with Mappable {
  CoreModel({
    required this.status,
    required this.code,
    required this.error,
  });

  final bool? status;
  final int? code;
  final CoreError? error;
}
