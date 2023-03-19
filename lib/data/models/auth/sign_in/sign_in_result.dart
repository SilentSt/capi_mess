import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.mapper.g.dart';

@MappableClass()
class SignInResult with Mappable {
  SignInResult({
    this.session,
  });
  
  final String? session;
}
