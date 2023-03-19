import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class CompanionModel with Mappable {
  CompanionModel({required this.uuid});
  
  final String uuid;

  
}
