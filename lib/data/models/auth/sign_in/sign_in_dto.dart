import 'package:dart_mappable/dart_mappable.dart';

import '../../models.mapper.g.dart';

@MappableClass()
class SignInDto with Mappable {
  SignInDto({
    required this.phone,
    required this.password,
  });

  final String phone;
  final String password;
}