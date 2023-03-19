import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class DocumentModel with Mappable {
  DocumentModel({
    required this.uuid,
    required this.documentId,
    required this.url,
    required this.meta,
  });

  final String uuid;
  @MappableField(key: 'document_id')
  final String documentId;
  final String url;
  final String meta;
}
