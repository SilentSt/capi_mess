import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass()
class MeResult extends UserResult {
  MeResult({
    super.firstName,
    super.isMe,
    super.lastName,
    super.login,
    super.loginAt,
    super.mail,
    super.phone,
    super.uuid,
    super.avatar,
    super.isOnline,
    super.lastActivity,
    super.role,
    this.sessionId,
  });

  @MappableField(key: 'session_id')
  final String? sessionId;
}
