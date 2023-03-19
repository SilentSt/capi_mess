import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class MessageModel extends CoreModel {
  MessageModel({
    required super.status,
    required super.code,
    required super.error,
    this.result,
  });

  final MessageResult? result;
}
