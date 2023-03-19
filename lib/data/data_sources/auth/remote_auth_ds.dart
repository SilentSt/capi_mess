import 'package:chopper/chopper.dart';
import 'package:template/data/models/models.dart';

part 'remote_auth_ds.chopper.dart';

@ChopperApi(baseUrl: 'auth/')
abstract class RemoteAuthDataSource extends ChopperService {
  static RemoteAuthDataSource create([ChopperClient? client]) => _$RemoteAuthDataSource(client);

  @FactoryConverter(
    request: FormUrlEncodedConverter.requestFactory,
  )
  @Post(
    path: 'login',
    headers: {
      'content-type': 'application/x-www-form-urlencoded',
    },
  )
  @Multipart()
  Future<Response<SignInModel>> signIn(
    @Part('phone') String phone,
    @Part('password') String password,
  );

  @FactoryConverter(
    request: FormUrlEncodedConverter.requestFactory,
  )
  @Post(
    path: 'login/verify',
    headers: {
      'content-type': 'application/x-www-form-urlencoded',
    },
  )
  @Multipart()
  Future<Response<VerifyModel>> verify({
    @Part('code') required String code,
    @Part('session_id') required String session,
  });

  @Post(path: 'register')
  Future<Response<SignUpModel>> signUp(@Body() final SignUpDto dto);

  @Get(path: 'me')
  Future<Response<MeModel>> me();

  @Patch(path: 'me')
  Future<Response<MeModel>> patchMe(@Body() final UserPatchDto dto);

  @Get(path: 'sessions')
  Future<Response<SessionModel>> sessions();
}
