import 'package:chopper/chopper.dart';
import 'package:template/data/models/models.dart';

part 'remote_chats_ds.chopper.dart';

@ChopperApi(baseUrl: 'chats')
abstract class RemoteChatsDataSource extends ChopperService {
  static RemoteChatsDataSource create([ChopperClient? client]) =>
      _$RemoteChatsDataSource(client);

  @Get()
  Future<Response<ChatsModel>> fetch();

  @Post()
  Future<Response<CreateChatsModel>> add(@Body() final ChatDto dto);
  
}
