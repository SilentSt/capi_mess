import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class AvatarModel with Mappable {
  AvatarModel({
    required this.documentId,
    required this.url,
  });

  @MappableField(key: 'document_id')
  final String documentId;
  final String url;
}
