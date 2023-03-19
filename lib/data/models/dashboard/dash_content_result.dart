import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass(ignoreNull: true)
class DashContentResult with Mappable {
  DashContentResult({
    this.id,
    this.title,
    this.description,
    this.content,
    this.authorId,
    this.previewId,
    this.previewLink,
  });

  final String? id;
  final String? title;
  final String? description;
  final String? content;
  final String? authorId;
  final String? previewId;
  final String? previewLink;
}
