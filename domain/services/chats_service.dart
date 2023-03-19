import 'package:template/data/data_sources/chats/remote_chats_ds.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/core/app_service.dart';

class ChatsService extends AppService {
  ChatsService(super.dialogService, this._rds);

  final RemoteChatsDataSource _rds;

  Future<List<ChatResult>> fetch() async {
    final res = await _rds.fetch();
    if (!res.isSuccessful) {
      dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return res.body?.result ?? [];
  }

  Future<ChatResult?> create(final ChatDto dto) async {
    final res = await _rds.add(dto);
    if (!res.isSuccessful) {
      dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return res.body?.result;
  }
}
