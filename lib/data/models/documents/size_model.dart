import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class SizeModel with Mappable {
  SizeModel({
    required this.size,
    required this.human,
  });

  final int size;
  final String human;
}
