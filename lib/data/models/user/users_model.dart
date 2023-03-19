import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class UsersModel extends CoreModel {
  UsersModel({
    required super.status,
    required super.code,
    required super.error,
    this.result = const [],
  });
  List<UserResult> result;
}
