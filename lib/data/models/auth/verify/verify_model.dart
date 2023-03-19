import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class VerifyModel extends CoreModel {
  VerifyModel({
    required super.status,
    required super.code,
    required super.error,
    this.accessToken,
    this.tokenType,
    this.userUuid,
  });

  @MappableField(key: 'access_token')
  final String? accessToken;
  @MappableField(key: 'token_type')
  final String? tokenType;
  @MappableField(key: 'user_uuid')
  final String? userUuid;
}
