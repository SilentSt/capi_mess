import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.mapper.g.dart';

@MappableClass()
class CoreException with Mappable {
  CoreException({
    this.exception,
    this.detail,
    this.message,
  });

  final String? exception;
  final String? detail;
  final String? message;
}
