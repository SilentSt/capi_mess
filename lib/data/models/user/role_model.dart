import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class RoleModel with Mappable {
  RoleModel({
    required this.id,
    required this.title,
  });
  final int id;
  final String title;

  
}
