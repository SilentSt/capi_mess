import 'package:dart_mappable/dart_mappable.dart';
import 'package:template/data/models/models.mapper.g.dart';

@MappableClass()
class DeviceModel with Mappable {
  DeviceModel({
    this.uuid,
    this.deviceFamily,
    this.osVersion,
    this.browserVersion,
    this.country,
    this.deviceType,
    this.osFamily,
    this.deviceBrand,
    this.browserFamily,
    this.ip,
    this.city,
  });

  final String? uuid;
  @MappableField(key: 'device_family')
  final String? deviceFamily;
  @MappableField(key: 'os_version')
  final String? osVersion;
  @MappableField(key: 'browser_version')
  final String? browserVersion;
  final String? country;
  @MappableField(key: 'device_type')
  final String? deviceType;
  @MappableField(key: 'os_family')
  final String? osFamily;
  @MappableField(key: 'device_brand')
  final String? deviceBrand;
  @MappableField(key: 'browser_family')
  final String? browserFamily;
  final String? ip;
  final String? city;
}
