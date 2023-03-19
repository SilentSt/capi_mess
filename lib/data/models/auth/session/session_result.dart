import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/core/core_status.dart';
import 'package:template/data/models/models.mapper.g.dart';
import 'package:template/data/models/auth/session/device_model.dart';

@MappableClass()
class SessionResult with Mappable {
  SessionResult({
    this.status,
    this.uuid,
    this.device,
  });

  final CoreStatus? status;
  final String? uuid;
  final DeviceModel? device;
}
