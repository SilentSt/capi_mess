import 'package:dart_mappable/dart_mappable.dart';

import '../../models.mapper.g.dart';

@MappableClass()
class SignUpDto with Mappable {
  SignUpDto({
    required this.login,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.password,
  });

  final String login;
  final String phone;
  @MappableField(key: 'first_name')
  final String firstName;
  @MappableField(key: 'last_name')
  final String lastName;
  final String password;
}
