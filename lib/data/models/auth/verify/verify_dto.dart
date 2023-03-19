import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.mapper.g.dart';

@MappableClass()
class VerifyDto with Mappable {
  VerifyDto({
    required this.sessionId,
    required this.code,
  });

  @MappableField(key: 'session_id')
  final String sessionId;
  final String code;
}


