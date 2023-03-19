import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.mapper.g.dart';

@MappableClass()
class DeletedMessageResult with Mappable {
  DeletedMessageResult({
    this.uuid,
  });
  final String? uuid;
}
