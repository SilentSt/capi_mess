import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class DeletedMessageModel extends CoreModel {
  DeletedMessageModel({
    required super.status,
    required super.code,
    required super.error,
    this.result,
  });

  final DeletedMessageResult? result;
}
