import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';
import 'package:template/data/models/user/role_model.dart';

@MappableClass()
class AuthorModel with Mappable {
  AuthorModel({
    this.uuid,
    this.login,
    this.firstName,
    this.lastName,
    this.loginAt,
    this.avatar,
    this.isOnline = false,
    this.role,
  });

  final String? uuid;
  final String? login;
  @MappableField(key: 'first_name')
  final String? firstName;
  @MappableField(key: 'last_name')
  final String? lastName;
  @MappableField(key: 'login_at')
  final String? loginAt;
  final AvatarModel? avatar;
  @MappableField(key: 'is_online')
  final bool isOnline;
  final RoleModel? role;
}
