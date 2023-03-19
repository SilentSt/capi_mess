import 'package:template/data/data_sources/auth/local_auth_ds.dart';
import 'package:template/data/data_sources/auth/local_auth_ds_impl.dart';
import 'package:template/data/data_sources/auth/remote_auth_ds.dart';
import 'package:template/data/models/models.dart';
import 'package:template/presentation/app/app.dart';
import 'package:template/presentation/navigation/app_router.dart';

import 'core/app_service.dart';

class AuthService extends AppService {
  AuthService(
    this._lds,
    this._rds,
    super.errorService,
  );
  final LocalAuthDataSource _lds;
  final RemoteAuthDataSource _rds;

  SignInDto? get savedUser => _lds.currentLoginDto.value;
  String? get token => _lds.currentToken.value;

  MeResult? meModel;

  @override
  Future<void> init() async {
    //LocalAuthDataSourceImpl.currentState.value = AuthState.authorized;
    LocalAuthDataSourceImpl.currentState.addListener(authListener);
    await _lds.init();
  }

  Future<void> authListener() async {
    if (LocalAuthDataSourceImpl.currentState.value == AuthState.none) {
      App.router.pushAndPopUntil(
        const AuthViewRoute(),
        predicate: (_) => false,
      );
    } else {
      App.router.pushAndPopUntil(
        const RootViewRoute(),
        predicate: (_) => false,
      );
    }
  }

  Future<String?> signin({
    required SignInDto dto,
    bool saveData = false,
  }) async {
    final res = await _rds.signIn(
      dto.phone,
      dto.password,
    );
    if (!res.isSuccessful || res.body?.result?.session == null) {
      await dialogService.showError(
        text: '${res.statusCode}',
      );
    }
    if (saveData) {
      await _lds.storeLoginDto(dto);
    }
    return res.body?.result?.session;
  }

  Future<void> verify({
    required VerifyDto dto,
  }) async {
    final res = await _rds.verify(code: dto.code, session: dto.sessionId);
    if (!res.isSuccessful || res.body?.accessToken == null) {
      await dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
      return;
    }
    _lds.storeSession(res.body?.accessToken ?? '');
  }

  Future<bool> signup(SignUpDto dto) async {
    final res = await _rds.signUp(dto);
    if (!res.isSuccessful || res.body?.result == null) {
      await dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return res.isSuccessful;
  }

  Future<MeResult?> me() async {
    final res = await _rds.me();
    if (!res.isSuccessful || res.body?.result == null) {
      await dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return meModel = res.body?.result;
  }

  Future<MeResult?> patchMe(UserPatchDto dto) async {
    final res = await _rds.patchMe(dto);
    if (!res.isSuccessful || res.body?.result == null) {
      await dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return res.body?.result;
  }

  Future<SessionModel?> sessions() async {
    final res = await _rds.sessions();
    if (!res.isSuccessful || res.body?.result == null) {
      await dialogService.showBackendError(error: (Mapper.fromValue<CoreModel>(res.error)).error);
    }
    return res.body;
  }

  Future<void> logout() async {
    await _lds.logout();
  }

  @override
  void dispose() {
    _lds.dispose();
  }
}
