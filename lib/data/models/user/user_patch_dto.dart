import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.dart';

@MappableClass(ignoreNull: true)
class UserPatchDto with Mappable {
  UserPatchDto({
    this.firstName,
    this.lastName,
    this.password,
    this.avatarId,
  });

  @MappableField(key: 'first_name')
  final String? firstName;
  @MappableField(key: 'last_name')
  final String? lastName;
  final String? password;
  @MappableField(key: 'avatar_id')
  final String? avatarId;
}
