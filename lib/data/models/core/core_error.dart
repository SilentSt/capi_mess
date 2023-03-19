import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class CoreError with Mappable {
  CoreError({
    this.code,
    this.message,
    this.exception,
  });

  final String? code;
  final String? message;
  final CoreException? exception;
}
