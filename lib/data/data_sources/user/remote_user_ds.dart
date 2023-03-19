import 'package:chopper/chopper.dart';
import 'package:template/data/models/models.dart';

part 'remote_user_ds.chopper.dart';

@ChopperApi(baseUrl: 'users')
abstract class RemoteUserDataSource extends ChopperService {
  static RemoteUserDataSource create([ChopperClient? client]) =>
      _$RemoteUserDataSource(client);

  @Get(path: '/{uuid}')
  Future<Response<MeModel>> getById(@Path('uuid') String uuid);

  @Get()
  Future<Response<UsersModel>> fetch();

}
