import 'package:template/domain/services/dialog_service.dart';

abstract class AppService {
  AppService(this.dialogService);
  final DialogService dialogService;

  Future<void> init() async {}
  void dispose() {}
}
