import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:template/data/data_sources/auth/remote_auth_ds.dart';
import 'package:template/data/data_sources/upload/mobile_upload_ds.dart';
import 'package:template/data/data_sources/upload/web_upload_ds.dart';
import 'package:template/domain/di/core/app_dependency.dart';
import 'package:template/domain/di/preload.dart';
import 'package:template/domain/services/auth_service.dart';
import 'package:template/domain/services/dialog_service.dart';
import 'package:template/domain/services/upload_service.dart';

class GlobalDependency extends AppDependency {
  GlobalDependency(super.context);

  @override
  Future<void> init(BuildContext context) async {
    final preloadDep = context.read<PreloadDependency>();

    final authRds = RemoteAuthDataSource.create(preloadDep.authClient);
    final uploadWds = WebUploadDataSource();
    final uploadMds = MobileUploadDataSource();

    _dialog = DialogService(context);
    _authService = AuthService(preloadDep.localAuthDS, authRds, _dialog);
    _uploadService = UploadService(uploadWds, uploadMds, _dialog);

    await _authService.init();
  }

  late final AuthService _authService;
  late final DialogService _dialog;
  late final UploadService _uploadService;

  AuthService get authService => _authService;
  DialogService get dialogService => _dialog;
  UploadService get uploadService => _uploadService;

  @override
  void dispose() {
    _authService.dispose();
  }
}

extension GlobalReader on BuildContext {
  GlobalDependency get global => read<GlobalDependency>();
}
