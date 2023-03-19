import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/user/author_model.dart';

@MappableClass()
class UserResult extends AuthorModel {
  UserResult({
    super.uuid,
    super.login,
    super.firstName,
    super.lastName,
    super.loginAt,
    super.avatar,
    super.isOnline,
    super.role,
    this.isMe,
    this.phone,
    this.mail,
    this.lastActivity,
    
  });

  @MappableField(key: 'is_me')
  final bool? isMe;
  final String? phone;
  final String? mail;
  @MappableField(key: 'last_activity')
  final DateTime? lastActivity;
}
