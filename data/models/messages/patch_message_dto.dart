import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.mapper.g.dart';

@MappableClass()
class PatchMessageDto with Mappable {
  final String? text;

  PatchMessageDto({
    this.text,
  });
}
