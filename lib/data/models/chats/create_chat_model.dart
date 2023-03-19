import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';
@MappableClass()
class CreateChatsModel extends CoreModel {
  CreateChatsModel({
    required super.status,
    required super.code,
    required super.error,
    this.result,
  });
  final ChatResult? result;
}
