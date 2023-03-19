import 'package:template/data/data_sources/messages/remote_messages_ds.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/core/app_service.dart';

class MessageService extends AppService {
  MessageService(
    super.dialogService,
    this._rds,
  );

  final RemoteMessagesDataSource _rds;

  Future<List<MessageResult>> fetch(
    final String chatId, {
    int limit = 20,
    int offset = 0,
  }) async {
    final res = await _rds.fetch(
      chatId: chatId,
      limit: limit,
      offset: offset,
    );
    if (!res.isSuccessful) {
      dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return res.body?.result ?? [];
  }

  Future<MessageResult?> send({
    required final String chatId,
    required final SendMessageDto dto,
  }) async {
    final res = await _rds.send(
      chatId: chatId,
      dto: dto,
    );
    if (!res.isSuccessful) {
      dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return res.body?.result;
  }

  Future<List<MessageResult>> fetchThread({
    required final String chatId,
    required final String messageId,
  }) async {
    final res = await _rds.fetchThread(
      chatId: chatId,
      messageId: messageId,
    );
    if (!res.isSuccessful) {
      dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return res.body?.result ?? [];
  }

  Future<DeletedMessageResult?> delete({
    required final String chatId,
    required final String messageId,
  }) async {
    final res = await _rds.delete(
      chatId: chatId,
      messageId: messageId,
    );
    if (!res.isSuccessful) {
      dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return res.body?.result;
  }

  Future<MessageResult?> patchMessage({
    required final String chatId,
    required final String messageId,
    required final PatchMessageDto dto,
  }) async {
    final res = await _rds.patchMessage(
      chatId: chatId,
      dto: dto,
      messageId: messageId,
    );
    if (!res.isSuccessful) {
      dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return res.body?.result;
  }
}
