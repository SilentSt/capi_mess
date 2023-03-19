import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class DocumentStats with Mappable {
  DocumentStats({
    required this.fileName,
    required this.contentType,
    required this.lastModified,
    required this.size,
  });

  final String fileName;
  final String contentType;
  final DateTime lastModified;
  final SizeModel size;

  String get name {
    final size = fileName.substring(8).length;

    final without_prefix = fileName.substring(8);

    if (without_prefix.length < 30) {
      return without_prefix;
    } else {
      final first = without_prefix.substring(0, 15);
      final last = without_prefix.substring(without_prefix.length - 15);
      return '$first...$last';
    }
  }
}
