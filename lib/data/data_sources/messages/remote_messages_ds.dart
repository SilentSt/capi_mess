import 'package:chopper/chopper.dart';
import 'package:template/data/models/models.dart';

part 'remote_messages_ds.chopper.dart';

@ChopperApi(baseUrl: 'chats/')
abstract class RemoteMessagesDataSource extends ChopperService {
  static RemoteMessagesDataSource create([ChopperClient? client]) => _$RemoteMessagesDataSource(client);

  @Get(path: r'{chat_id}/messages')
  Future<Response<MessagesModel>> fetch({
    @Path('chat_id') required String chatId,
    @Query('limit') int limit = 20,
    @Query('offset') int offset = 0,
  });

  @Post(path: r'{chat_id}/messages')
  Future<Response<MessageModel>> send({
    @Path('chat_id') required final String chatId,
    @Body() required final SendMessageDto dto,
  });

  @Get(path: r'{chat_id}/messages/{message_id}')
  Future<Response<MessagesModel>> fetchThread({
    @Path('chat_id') required final String chatId,
    @Path('message_id') required final String messageId,
  });

  @Delete(path: r'{chat_id}/messages/{message_id}')
  Future<Response<DeletedMessageModel>> delete({
    @Path('chat_id') required final String chatId,
    @Path('message_id') required final String messageId,
  });

  @Patch(path: r'{chat_id}/messages/{message_id}')
  Future<Response<MessageModel>> patchMessage({
    @Path('chat_id') required final String chatId,
    @Path('message_id') required final String messageId,
    @Body() required final PatchMessageDto dto,
  });
}
