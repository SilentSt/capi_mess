import 'package:template/data/data_sources/user/remote_user_ds.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/core/app_service.dart';

class UserService extends AppService {
  UserService(super.dialogService, this._rds);

  final RemoteUserDataSource _rds;

  Future<MeResult?> getById(String? id) async {
    if (id == null) return null;
    final res = await _rds.getById(id);
    if (!res.isSuccessful || res.body?.result == null) {
      await dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return res.body?.result;
  }

  Future<List<UserResult>> fetch() async {
    final res = await _rds.fetch();
    if (!res.isSuccessful) {
      await dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return res.body?.result ?? [];
  }
}
