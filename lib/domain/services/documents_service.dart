import 'package:template/data/data_sources/documents/remote_documents_ds.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/core/app_service.dart';

class DocumentsService extends AppService {
  DocumentsService(super.dialogService, this._rds);
  final RemoteDocumentsDataSource _rds;

  Future<DocumentStats?> getById(String uuid) async {
    final res = await _rds.getById(uuid);
    if (!res.isSuccessful) {
      dialogService.showError(
        text: 'Не удалось получить данные документа',
      );
    }
    return res.body;
  }
}
