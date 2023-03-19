import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'auth/session/device_model.dart';
import 'auth/session/session_model.dart';
import 'auth/session/session_result.dart';
import 'auth/sign_in/sign_in_dto.dart';
import 'auth/sign_in/sign_in_model.dart';
import 'auth/sign_in/sign_in_result.dart';
import 'auth/sign_up/sign_up_dto.dart';
import 'auth/sign_up/sign_up_model.dart';
import 'auth/verify/verify_dto.dart';
import 'auth/verify/verify_model.dart';
import 'chats/chat_creator.dart';
import 'chats/chat_dto.dart';
import 'chats/chat_model.dart';
import 'chats/chat_result.dart';
import 'chats/chat_type.dart';
import 'chats/chats_model.dart';
import 'chats/create_chat_model.dart';
import 'chats/status_model.dart';
import 'core/core_error.dart';
import 'core/core_exception.dart';
import 'core/core_model.dart';
import 'core/core_status.dart';
import 'dashboard/dash_content_model.dart';
import 'dashboard/dash_content_result.dart';
import 'dashboard/dash_contents_model.dart';
import 'documents/document_stats.dart';
import 'documents/size_model.dart';
import 'messages/deleted_message_model.dart';
import 'messages/deleted_message_result.dart';
import 'messages/document_model.dart';
import 'messages/message_model.dart';
import 'messages/message_result.dart';
import 'messages/messages_model.dart';
import 'messages/patch_message_dto.dart';
import 'messages/send_message_dto.dart';
import 'socket_models/socket_delete_message_model.dart';
import 'socket_models/socket_message_model.dart';
import 'socket_models/typing_dto.dart';
import 'socket_models/typing_model.dart';
import 'user/author_model.dart';
import 'user/avatar_model.dart';
import 'user/companion_model.dart';
import 'user/me_model.dart';
import 'user/me_result.dart';
import 'user/role_model.dart';
import 'user/user_patch_dto.dart';
import 'user/user_result.dart';
import 'user/users_model.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  CoreErrorMapper._(),
  CoreExceptionMapper._(),
  CoreModelMapper._(),
  UserResultMapper._(),
  AuthorModelMapper._(),
  MeResultMapper._(),
  MeModelMapper._(),
  CompanionModelMapper._(),
  UsersModelMapper._(),
  UserPatchDtoMapper._(),
  AvatarModelMapper._(),
  DeletedMessageResultMapper._(),
  DeletedMessageModelMapper._(),
  MessageModelMapper._(),
  MessageResultMapper._(),
  MessagesModelMapper._(),
  PatchMessageDtoMapper._(),
  SendMessageDtoMapper._(),
  DocumentModelMapper._(),
  SocketDeleteMessageModelMapper._(),
  TypingDtoMapper._(),
  TypingModelMapper._(),
  SocketMessageModelMapper._(),
  ChatModelMapper._(),
  ChatResultMapper._(),
  ChatTypeMapper._(),
  ChatsModelMapper._(),
  StatusModelMapper._(),
  ChatDtoMapper._(),
  ChatCreatorMapper._(),
  CreateChatsModelMapper._(),
  DashContentResultMapper._(),
  DashContentModelMapper._(),
  DashsContentModelMapper._(),
  SizeModelMapper._(),
  DocumentStatsMapper._(),
  RoleModelMapper._(),
  SignInDtoMapper._(),
  SignInModelMapper._(),
  SignInResultMapper._(),
  SignUpDtoMapper._(),
  SignUpModelMapper._(),
  VerifyDtoMapper._(),
  VerifyModelMapper._(),
  DeviceModelMapper._(),
  SessionModelMapper._(),
  SessionResultMapper._(),
  CoreStatusMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class CoreErrorMapper extends BaseMapper<CoreError> {
  CoreErrorMapper._();

  @override Function get decoder => decode;
  CoreError decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  CoreError fromMap(Map<String, dynamic> map) => CoreError(code: Mapper.i.$getOpt(map, 'code'), message: Mapper.i.$getOpt(map, 'message'), exception: Mapper.i.$getOpt(map, 'exception'));

  @override Function get encoder => (CoreError v) => encode(v);
  dynamic encode(CoreError v) => toMap(v);
  Map<String, dynamic> toMap(CoreError c) => {'code': Mapper.i.$enc(c.code, 'code'), 'message': Mapper.i.$enc(c.message, 'message'), 'exception': Mapper.i.$enc(c.exception, 'exception')};

  @override String stringify(CoreError self) => 'CoreError(code: ${Mapper.asString(self.code)}, message: ${Mapper.asString(self.message)}, exception: ${Mapper.asString(self.exception)})';
  @override int hash(CoreError self) => Mapper.hash(self.code) ^ Mapper.hash(self.message) ^ Mapper.hash(self.exception);
  @override bool equals(CoreError self, CoreError other) => Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.message, other.message) && Mapper.isEqual(self.exception, other.exception);

  @override Function get typeFactory => (f) => f<CoreError>();
}

extension CoreErrorMapperExtension  on CoreError {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CoreErrorCopyWith<CoreError> get copyWith => CoreErrorCopyWith(this, $identity);
}

abstract class CoreErrorCopyWith<$R> {
  factory CoreErrorCopyWith(CoreError value, Then<CoreError, $R> then) = _CoreErrorCopyWithImpl<$R>;
  CoreExceptionCopyWith<$R>? get exception;
  $R call({String? code, String? message, CoreException? exception});
  $R apply(CoreError Function(CoreError) transform);
}

class _CoreErrorCopyWithImpl<$R> extends BaseCopyWith<CoreError, $R> implements CoreErrorCopyWith<$R> {
  _CoreErrorCopyWithImpl(CoreError value, Then<CoreError, $R> then) : super(value, then);

  @override CoreExceptionCopyWith<$R>? get exception => $value.exception != null ? CoreExceptionCopyWith($value.exception!, (v) => call(exception: v)) : null;
  @override $R call({Object? code = $none, Object? message = $none, Object? exception = $none}) => $then(CoreError(code: or(code, $value.code), message: or(message, $value.message), exception: or(exception, $value.exception)));
}

class CoreExceptionMapper extends BaseMapper<CoreException> {
  CoreExceptionMapper._();

  @override Function get decoder => decode;
  CoreException decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  CoreException fromMap(Map<String, dynamic> map) => CoreException(exception: Mapper.i.$getOpt(map, 'exception'), detail: Mapper.i.$getOpt(map, 'detail'), message: Mapper.i.$getOpt(map, 'message'));

  @override Function get encoder => (CoreException v) => encode(v);
  dynamic encode(CoreException v) => toMap(v);
  Map<String, dynamic> toMap(CoreException c) => {'exception': Mapper.i.$enc(c.exception, 'exception'), 'detail': Mapper.i.$enc(c.detail, 'detail'), 'message': Mapper.i.$enc(c.message, 'message')};

  @override String stringify(CoreException self) => 'CoreException(exception: ${Mapper.asString(self.exception)}, detail: ${Mapper.asString(self.detail)}, message: ${Mapper.asString(self.message)})';
  @override int hash(CoreException self) => Mapper.hash(self.exception) ^ Mapper.hash(self.detail) ^ Mapper.hash(self.message);
  @override bool equals(CoreException self, CoreException other) => Mapper.isEqual(self.exception, other.exception) && Mapper.isEqual(self.detail, other.detail) && Mapper.isEqual(self.message, other.message);

  @override Function get typeFactory => (f) => f<CoreException>();
}

extension CoreExceptionMapperExtension  on CoreException {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CoreExceptionCopyWith<CoreException> get copyWith => CoreExceptionCopyWith(this, $identity);
}

abstract class CoreExceptionCopyWith<$R> {
  factory CoreExceptionCopyWith(CoreException value, Then<CoreException, $R> then) = _CoreExceptionCopyWithImpl<$R>;
  $R call({String? exception, String? detail, String? message});
  $R apply(CoreException Function(CoreException) transform);
}

class _CoreExceptionCopyWithImpl<$R> extends BaseCopyWith<CoreException, $R> implements CoreExceptionCopyWith<$R> {
  _CoreExceptionCopyWithImpl(CoreException value, Then<CoreException, $R> then) : super(value, then);

  @override $R call({Object? exception = $none, Object? detail = $none, Object? message = $none}) => $then(CoreException(exception: or(exception, $value.exception), detail: or(detail, $value.detail), message: or(message, $value.message)));
}

class CoreModelMapper extends BaseMapper<CoreModel> {
  CoreModelMapper._();

  @override Function get decoder => decode;
  CoreModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  CoreModel fromMap(Map<String, dynamic> map) => CoreModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'));

  @override Function get encoder => (CoreModel v) => encode(v);
  dynamic encode(CoreModel v) {
    if (v is MeModel) { return MeModelMapper._().encode(v); }
    else if (v is UsersModel) { return UsersModelMapper._().encode(v); }
    else if (v is DeletedMessageModel) { return DeletedMessageModelMapper._().encode(v); }
    else if (v is MessageModel) { return MessageModelMapper._().encode(v); }
    else if (v is MessagesModel) { return MessagesModelMapper._().encode(v); }
    else if (v is ChatsModel) { return ChatsModelMapper._().encode(v); }
    else if (v is CreateChatsModel) { return CreateChatsModelMapper._().encode(v); }
    else if (v is DashContentModel) { return DashContentModelMapper._().encode(v); }
    else if (v is DashsContentModel) { return DashsContentModelMapper._().encode(v); }
    else if (v is SignInModel) { return SignInModelMapper._().encode(v); }
    else if (v is SignUpModel) { return SignUpModelMapper._().encode(v); }
    else if (v is VerifyModel) { return VerifyModelMapper._().encode(v); }
    else if (v is SessionModel) { return SessionModelMapper._().encode(v); }
    else { return toMap(v); }
  }
  Map<String, dynamic> toMap(CoreModel c) => {'status': Mapper.i.$enc(c.status, 'status'), 'code': Mapper.i.$enc(c.code, 'code'), 'error': Mapper.i.$enc(c.error, 'error')};

  @override String stringify(CoreModel self) => 'CoreModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)})';
  @override int hash(CoreModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error);
  @override bool equals(CoreModel self, CoreModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error);

  @override Function get typeFactory => (f) => f<CoreModel>();
}

extension CoreModelMapperExtension  on CoreModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CoreModelCopyWith<CoreModel> get copyWith => CoreModelCopyWith(this, $identity);
}

abstract class CoreModelCopyWith<$R> {
  factory CoreModelCopyWith(CoreModel value, Then<CoreModel, $R> then) = _CoreModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  $R call({bool? status, int? code, CoreError? error});
  $R apply(CoreModel Function(CoreModel) transform);
}

class _CoreModelCopyWithImpl<$R> extends BaseCopyWith<CoreModel, $R> implements CoreModelCopyWith<$R> {
  _CoreModelCopyWithImpl(CoreModel value, Then<CoreModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none}) => $then(CoreModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error)));
}

class UserResultMapper extends BaseMapper<UserResult> {
  UserResultMapper._();

  @override Function get decoder => decode;
  UserResult decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  UserResult fromMap(Map<String, dynamic> map) => UserResult(uuid: Mapper.i.$getOpt(map, 'uuid'), login: Mapper.i.$getOpt(map, 'login'), firstName: Mapper.i.$getOpt(map, 'first_name'), lastName: Mapper.i.$getOpt(map, 'last_name'), loginAt: Mapper.i.$getOpt(map, 'login_at'), avatar: Mapper.i.$getOpt(map, 'avatar'), isOnline: Mapper.i.$getOpt(map, 'is_online') ?? false, role: Mapper.i.$getOpt(map, 'role'), isMe: Mapper.i.$getOpt(map, 'is_me'), phone: Mapper.i.$getOpt(map, 'phone'), mail: Mapper.i.$getOpt(map, 'mail'), lastActivity: Mapper.i.$getOpt(map, 'last_activity'));

  @override Function get encoder => (UserResult v) => encode(v);
  dynamic encode(UserResult v) {
    if (v is MeResult) { return MeResultMapper._().encode(v); }
    else { return toMap(v); }
  }
  Map<String, dynamic> toMap(UserResult u) => {'uuid': Mapper.i.$enc(u.uuid, 'uuid'), 'login': Mapper.i.$enc(u.login, 'login'), 'first_name': Mapper.i.$enc(u.firstName, 'firstName'), 'last_name': Mapper.i.$enc(u.lastName, 'lastName'), 'login_at': Mapper.i.$enc(u.loginAt, 'loginAt'), 'avatar': Mapper.i.$enc(u.avatar, 'avatar'), 'is_online': Mapper.i.$enc(u.isOnline, 'isOnline'), 'role': Mapper.i.$enc(u.role, 'role'), 'is_me': Mapper.i.$enc(u.isMe, 'isMe'), 'phone': Mapper.i.$enc(u.phone, 'phone'), 'mail': Mapper.i.$enc(u.mail, 'mail'), 'last_activity': Mapper.i.$enc(u.lastActivity, 'lastActivity')};

  @override String stringify(UserResult self) => 'UserResult(uuid: ${Mapper.asString(self.uuid)}, login: ${Mapper.asString(self.login)}, firstName: ${Mapper.asString(self.firstName)}, lastName: ${Mapper.asString(self.lastName)}, loginAt: ${Mapper.asString(self.loginAt)}, avatar: ${Mapper.asString(self.avatar)}, isOnline: ${Mapper.asString(self.isOnline)}, role: ${Mapper.asString(self.role)}, isMe: ${Mapper.asString(self.isMe)}, phone: ${Mapper.asString(self.phone)}, mail: ${Mapper.asString(self.mail)}, lastActivity: ${Mapper.asString(self.lastActivity)})';
  @override int hash(UserResult self) => Mapper.hash(self.uuid) ^ Mapper.hash(self.login) ^ Mapper.hash(self.firstName) ^ Mapper.hash(self.lastName) ^ Mapper.hash(self.loginAt) ^ Mapper.hash(self.avatar) ^ Mapper.hash(self.isOnline) ^ Mapper.hash(self.role) ^ Mapper.hash(self.isMe) ^ Mapper.hash(self.phone) ^ Mapper.hash(self.mail) ^ Mapper.hash(self.lastActivity);
  @override bool equals(UserResult self, UserResult other) => Mapper.isEqual(self.uuid, other.uuid) && Mapper.isEqual(self.login, other.login) && Mapper.isEqual(self.firstName, other.firstName) && Mapper.isEqual(self.lastName, other.lastName) && Mapper.isEqual(self.loginAt, other.loginAt) && Mapper.isEqual(self.avatar, other.avatar) && Mapper.isEqual(self.isOnline, other.isOnline) && Mapper.isEqual(self.role, other.role) && Mapper.isEqual(self.isMe, other.isMe) && Mapper.isEqual(self.phone, other.phone) && Mapper.isEqual(self.mail, other.mail) && Mapper.isEqual(self.lastActivity, other.lastActivity);

  @override Function get typeFactory => (f) => f<UserResult>();
}

extension UserResultMapperExtension  on UserResult {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  UserResultCopyWith<UserResult> get copyWith => UserResultCopyWith(this, $identity);
}

abstract class UserResultCopyWith<$R> {
  factory UserResultCopyWith(UserResult value, Then<UserResult, $R> then) = _UserResultCopyWithImpl<$R>;
  AvatarModelCopyWith<$R>? get avatar;
  RoleModelCopyWith<$R>? get role;
  $R call({String? uuid, String? login, String? firstName, String? lastName, String? loginAt, AvatarModel? avatar, bool? isOnline, RoleModel? role, bool? isMe, String? phone, String? mail, DateTime? lastActivity});
  $R apply(UserResult Function(UserResult) transform);
}

class _UserResultCopyWithImpl<$R> extends BaseCopyWith<UserResult, $R> implements UserResultCopyWith<$R> {
  _UserResultCopyWithImpl(UserResult value, Then<UserResult, $R> then) : super(value, then);

  @override AvatarModelCopyWith<$R>? get avatar => $value.avatar != null ? AvatarModelCopyWith($value.avatar!, (v) => call(avatar: v)) : null;
  @override RoleModelCopyWith<$R>? get role => $value.role != null ? RoleModelCopyWith($value.role!, (v) => call(role: v)) : null;
  @override $R call({Object? uuid = $none, Object? login = $none, Object? firstName = $none, Object? lastName = $none, Object? loginAt = $none, Object? avatar = $none, bool? isOnline, Object? role = $none, Object? isMe = $none, Object? phone = $none, Object? mail = $none, Object? lastActivity = $none}) => $then(UserResult(uuid: or(uuid, $value.uuid), login: or(login, $value.login), firstName: or(firstName, $value.firstName), lastName: or(lastName, $value.lastName), loginAt: or(loginAt, $value.loginAt), avatar: or(avatar, $value.avatar), isOnline: isOnline ?? $value.isOnline, role: or(role, $value.role), isMe: or(isMe, $value.isMe), phone: or(phone, $value.phone), mail: or(mail, $value.mail), lastActivity: or(lastActivity, $value.lastActivity)));
}

class AuthorModelMapper extends BaseMapper<AuthorModel> {
  AuthorModelMapper._();

  @override Function get decoder => decode;
  AuthorModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  AuthorModel fromMap(Map<String, dynamic> map) => AuthorModel(uuid: Mapper.i.$getOpt(map, 'uuid'), login: Mapper.i.$getOpt(map, 'login'), firstName: Mapper.i.$getOpt(map, 'first_name'), lastName: Mapper.i.$getOpt(map, 'last_name'), loginAt: Mapper.i.$getOpt(map, 'login_at'), avatar: Mapper.i.$getOpt(map, 'avatar'), isOnline: Mapper.i.$getOpt(map, 'is_online') ?? false, role: Mapper.i.$getOpt(map, 'role'));

  @override Function get encoder => (AuthorModel v) => encode(v);
  dynamic encode(AuthorModel v) {
    if (v is UserResult) { return UserResultMapper._().encode(v); }
    else { return toMap(v); }
  }
  Map<String, dynamic> toMap(AuthorModel a) => {'uuid': Mapper.i.$enc(a.uuid, 'uuid'), 'login': Mapper.i.$enc(a.login, 'login'), 'first_name': Mapper.i.$enc(a.firstName, 'firstName'), 'last_name': Mapper.i.$enc(a.lastName, 'lastName'), 'login_at': Mapper.i.$enc(a.loginAt, 'loginAt'), 'avatar': Mapper.i.$enc(a.avatar, 'avatar'), 'is_online': Mapper.i.$enc(a.isOnline, 'isOnline'), 'role': Mapper.i.$enc(a.role, 'role')};

  @override String stringify(AuthorModel self) => 'AuthorModel(uuid: ${Mapper.asString(self.uuid)}, login: ${Mapper.asString(self.login)}, firstName: ${Mapper.asString(self.firstName)}, lastName: ${Mapper.asString(self.lastName)}, loginAt: ${Mapper.asString(self.loginAt)}, avatar: ${Mapper.asString(self.avatar)}, isOnline: ${Mapper.asString(self.isOnline)}, role: ${Mapper.asString(self.role)})';
  @override int hash(AuthorModel self) => Mapper.hash(self.uuid) ^ Mapper.hash(self.login) ^ Mapper.hash(self.firstName) ^ Mapper.hash(self.lastName) ^ Mapper.hash(self.loginAt) ^ Mapper.hash(self.avatar) ^ Mapper.hash(self.isOnline) ^ Mapper.hash(self.role);
  @override bool equals(AuthorModel self, AuthorModel other) => Mapper.isEqual(self.uuid, other.uuid) && Mapper.isEqual(self.login, other.login) && Mapper.isEqual(self.firstName, other.firstName) && Mapper.isEqual(self.lastName, other.lastName) && Mapper.isEqual(self.loginAt, other.loginAt) && Mapper.isEqual(self.avatar, other.avatar) && Mapper.isEqual(self.isOnline, other.isOnline) && Mapper.isEqual(self.role, other.role);

  @override Function get typeFactory => (f) => f<AuthorModel>();
}

extension AuthorModelMapperExtension  on AuthorModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AuthorModelCopyWith<AuthorModel> get copyWith => AuthorModelCopyWith(this, $identity);
}

abstract class AuthorModelCopyWith<$R> {
  factory AuthorModelCopyWith(AuthorModel value, Then<AuthorModel, $R> then) = _AuthorModelCopyWithImpl<$R>;
  AvatarModelCopyWith<$R>? get avatar;
  RoleModelCopyWith<$R>? get role;
  $R call({String? uuid, String? login, String? firstName, String? lastName, String? loginAt, AvatarModel? avatar, bool? isOnline, RoleModel? role});
  $R apply(AuthorModel Function(AuthorModel) transform);
}

class _AuthorModelCopyWithImpl<$R> extends BaseCopyWith<AuthorModel, $R> implements AuthorModelCopyWith<$R> {
  _AuthorModelCopyWithImpl(AuthorModel value, Then<AuthorModel, $R> then) : super(value, then);

  @override AvatarModelCopyWith<$R>? get avatar => $value.avatar != null ? AvatarModelCopyWith($value.avatar!, (v) => call(avatar: v)) : null;
  @override RoleModelCopyWith<$R>? get role => $value.role != null ? RoleModelCopyWith($value.role!, (v) => call(role: v)) : null;
  @override $R call({Object? uuid = $none, Object? login = $none, Object? firstName = $none, Object? lastName = $none, Object? loginAt = $none, Object? avatar = $none, bool? isOnline, Object? role = $none}) => $then(AuthorModel(uuid: or(uuid, $value.uuid), login: or(login, $value.login), firstName: or(firstName, $value.firstName), lastName: or(lastName, $value.lastName), loginAt: or(loginAt, $value.loginAt), avatar: or(avatar, $value.avatar), isOnline: isOnline ?? $value.isOnline, role: or(role, $value.role)));
}

class MeResultMapper extends BaseMapper<MeResult> {
  MeResultMapper._();

  @override Function get decoder => decode;
  MeResult decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  MeResult fromMap(Map<String, dynamic> map) => MeResult(firstName: Mapper.i.$getOpt(map, 'first_name'), isMe: Mapper.i.$getOpt(map, 'is_me'), lastName: Mapper.i.$getOpt(map, 'last_name'), login: Mapper.i.$getOpt(map, 'login'), loginAt: Mapper.i.$getOpt(map, 'login_at'), mail: Mapper.i.$getOpt(map, 'mail'), phone: Mapper.i.$getOpt(map, 'phone'), uuid: Mapper.i.$getOpt(map, 'uuid'), avatar: Mapper.i.$getOpt(map, 'avatar'), isOnline: Mapper.i.$getOpt(map, 'is_online') ?? false, lastActivity: Mapper.i.$getOpt(map, 'last_activity'), role: Mapper.i.$getOpt(map, 'role'), sessionId: Mapper.i.$getOpt(map, 'session_id'));

  @override Function get encoder => (MeResult v) => encode(v);
  dynamic encode(MeResult v) => toMap(v);
  Map<String, dynamic> toMap(MeResult m) => {'first_name': Mapper.i.$enc(m.firstName, 'firstName'), 'is_me': Mapper.i.$enc(m.isMe, 'isMe'), 'last_name': Mapper.i.$enc(m.lastName, 'lastName'), 'login': Mapper.i.$enc(m.login, 'login'), 'login_at': Mapper.i.$enc(m.loginAt, 'loginAt'), 'mail': Mapper.i.$enc(m.mail, 'mail'), 'phone': Mapper.i.$enc(m.phone, 'phone'), 'uuid': Mapper.i.$enc(m.uuid, 'uuid'), 'avatar': Mapper.i.$enc(m.avatar, 'avatar'), 'is_online': Mapper.i.$enc(m.isOnline, 'isOnline'), 'last_activity': Mapper.i.$enc(m.lastActivity, 'lastActivity'), 'role': Mapper.i.$enc(m.role, 'role'), 'session_id': Mapper.i.$enc(m.sessionId, 'sessionId')};

  @override String stringify(MeResult self) => 'MeResult(uuid: ${Mapper.asString(self.uuid)}, login: ${Mapper.asString(self.login)}, firstName: ${Mapper.asString(self.firstName)}, lastName: ${Mapper.asString(self.lastName)}, loginAt: ${Mapper.asString(self.loginAt)}, avatar: ${Mapper.asString(self.avatar)}, isOnline: ${Mapper.asString(self.isOnline)}, role: ${Mapper.asString(self.role)}, isMe: ${Mapper.asString(self.isMe)}, phone: ${Mapper.asString(self.phone)}, mail: ${Mapper.asString(self.mail)}, lastActivity: ${Mapper.asString(self.lastActivity)}, sessionId: ${Mapper.asString(self.sessionId)})';
  @override int hash(MeResult self) => Mapper.hash(self.uuid) ^ Mapper.hash(self.login) ^ Mapper.hash(self.firstName) ^ Mapper.hash(self.lastName) ^ Mapper.hash(self.loginAt) ^ Mapper.hash(self.avatar) ^ Mapper.hash(self.isOnline) ^ Mapper.hash(self.role) ^ Mapper.hash(self.isMe) ^ Mapper.hash(self.phone) ^ Mapper.hash(self.mail) ^ Mapper.hash(self.lastActivity) ^ Mapper.hash(self.sessionId);
  @override bool equals(MeResult self, MeResult other) => Mapper.isEqual(self.uuid, other.uuid) && Mapper.isEqual(self.login, other.login) && Mapper.isEqual(self.firstName, other.firstName) && Mapper.isEqual(self.lastName, other.lastName) && Mapper.isEqual(self.loginAt, other.loginAt) && Mapper.isEqual(self.avatar, other.avatar) && Mapper.isEqual(self.isOnline, other.isOnline) && Mapper.isEqual(self.role, other.role) && Mapper.isEqual(self.isMe, other.isMe) && Mapper.isEqual(self.phone, other.phone) && Mapper.isEqual(self.mail, other.mail) && Mapper.isEqual(self.lastActivity, other.lastActivity) && Mapper.isEqual(self.sessionId, other.sessionId);

  @override Function get typeFactory => (f) => f<MeResult>();
}

extension MeResultMapperExtension  on MeResult {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  MeResultCopyWith<MeResult> get copyWith => MeResultCopyWith(this, $identity);
}

abstract class MeResultCopyWith<$R> {
  factory MeResultCopyWith(MeResult value, Then<MeResult, $R> then) = _MeResultCopyWithImpl<$R>;
  AvatarModelCopyWith<$R>? get avatar;
  RoleModelCopyWith<$R>? get role;
  $R call({String? firstName, bool? isMe, String? lastName, String? login, String? loginAt, String? mail, String? phone, String? uuid, AvatarModel? avatar, bool? isOnline, DateTime? lastActivity, RoleModel? role, String? sessionId});
  $R apply(MeResult Function(MeResult) transform);
}

class _MeResultCopyWithImpl<$R> extends BaseCopyWith<MeResult, $R> implements MeResultCopyWith<$R> {
  _MeResultCopyWithImpl(MeResult value, Then<MeResult, $R> then) : super(value, then);

  @override AvatarModelCopyWith<$R>? get avatar => $value.avatar != null ? AvatarModelCopyWith($value.avatar!, (v) => call(avatar: v)) : null;
  @override RoleModelCopyWith<$R>? get role => $value.role != null ? RoleModelCopyWith($value.role!, (v) => call(role: v)) : null;
  @override $R call({Object? firstName = $none, Object? isMe = $none, Object? lastName = $none, Object? login = $none, Object? loginAt = $none, Object? mail = $none, Object? phone = $none, Object? uuid = $none, Object? avatar = $none, bool? isOnline, Object? lastActivity = $none, Object? role = $none, Object? sessionId = $none}) => $then(MeResult(firstName: or(firstName, $value.firstName), isMe: or(isMe, $value.isMe), lastName: or(lastName, $value.lastName), login: or(login, $value.login), loginAt: or(loginAt, $value.loginAt), mail: or(mail, $value.mail), phone: or(phone, $value.phone), uuid: or(uuid, $value.uuid), avatar: or(avatar, $value.avatar), isOnline: isOnline ?? $value.isOnline, lastActivity: or(lastActivity, $value.lastActivity), role: or(role, $value.role), sessionId: or(sessionId, $value.sessionId)));
}

class MeModelMapper extends BaseMapper<MeModel> {
  MeModelMapper._();

  @override Function get decoder => decode;
  MeModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  MeModel fromMap(Map<String, dynamic> map) => MeModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'), result: Mapper.i.$getOpt(map, 'result'));

  @override Function get encoder => (MeModel v) => encode(v);
  dynamic encode(MeModel v) => toMap(v);
  Map<String, dynamic> toMap(MeModel m) => {'status': Mapper.i.$enc(m.status, 'status'), 'code': Mapper.i.$enc(m.code, 'code'), 'error': Mapper.i.$enc(m.error, 'error'), 'result': Mapper.i.$enc(m.result, 'result')};

  @override String stringify(MeModel self) => 'MeModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)}, result: ${Mapper.asString(self.result)})';
  @override int hash(MeModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error) ^ Mapper.hash(self.result);
  @override bool equals(MeModel self, MeModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error) && Mapper.isEqual(self.result, other.result);

  @override Function get typeFactory => (f) => f<MeModel>();
}

extension MeModelMapperExtension  on MeModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  MeModelCopyWith<MeModel> get copyWith => MeModelCopyWith(this, $identity);
}

abstract class MeModelCopyWith<$R> {
  factory MeModelCopyWith(MeModel value, Then<MeModel, $R> then) = _MeModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  MeResultCopyWith<$R>? get result;
  $R call({bool? status, int? code, CoreError? error, MeResult? result});
  $R apply(MeModel Function(MeModel) transform);
}

class _MeModelCopyWithImpl<$R> extends BaseCopyWith<MeModel, $R> implements MeModelCopyWith<$R> {
  _MeModelCopyWithImpl(MeModel value, Then<MeModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override MeResultCopyWith<$R>? get result => $value.result != null ? MeResultCopyWith($value.result!, (v) => call(result: v)) : null;
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none, Object? result = $none}) => $then(MeModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error), result: or(result, $value.result)));
}

class CompanionModelMapper extends BaseMapper<CompanionModel> {
  CompanionModelMapper._();

  @override Function get decoder => decode;
  CompanionModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  CompanionModel fromMap(Map<String, dynamic> map) => CompanionModel(uuid: Mapper.i.$get(map, 'uuid'));

  @override Function get encoder => (CompanionModel v) => encode(v);
  dynamic encode(CompanionModel v) => toMap(v);
  Map<String, dynamic> toMap(CompanionModel c) => {'uuid': Mapper.i.$enc(c.uuid, 'uuid')};

  @override String stringify(CompanionModel self) => 'CompanionModel(uuid: ${Mapper.asString(self.uuid)})';
  @override int hash(CompanionModel self) => Mapper.hash(self.uuid);
  @override bool equals(CompanionModel self, CompanionModel other) => Mapper.isEqual(self.uuid, other.uuid);

  @override Function get typeFactory => (f) => f<CompanionModel>();
}

extension CompanionModelMapperExtension  on CompanionModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CompanionModelCopyWith<CompanionModel> get copyWith => CompanionModelCopyWith(this, $identity);
}

abstract class CompanionModelCopyWith<$R> {
  factory CompanionModelCopyWith(CompanionModel value, Then<CompanionModel, $R> then) = _CompanionModelCopyWithImpl<$R>;
  $R call({String? uuid});
  $R apply(CompanionModel Function(CompanionModel) transform);
}

class _CompanionModelCopyWithImpl<$R> extends BaseCopyWith<CompanionModel, $R> implements CompanionModelCopyWith<$R> {
  _CompanionModelCopyWithImpl(CompanionModel value, Then<CompanionModel, $R> then) : super(value, then);

  @override $R call({String? uuid}) => $then(CompanionModel(uuid: uuid ?? $value.uuid));
}

class UsersModelMapper extends BaseMapper<UsersModel> {
  UsersModelMapper._();

  @override Function get decoder => decode;
  UsersModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  UsersModel fromMap(Map<String, dynamic> map) => UsersModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'), result: Mapper.i.$getOpt(map, 'result') ?? const []);

  @override Function get encoder => (UsersModel v) => encode(v);
  dynamic encode(UsersModel v) => toMap(v);
  Map<String, dynamic> toMap(UsersModel u) => {'status': Mapper.i.$enc(u.status, 'status'), 'code': Mapper.i.$enc(u.code, 'code'), 'error': Mapper.i.$enc(u.error, 'error'), 'result': Mapper.i.$enc(u.result, 'result')};

  @override String stringify(UsersModel self) => 'UsersModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)}, result: ${Mapper.asString(self.result)})';
  @override int hash(UsersModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error) ^ Mapper.hash(self.result);
  @override bool equals(UsersModel self, UsersModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error) && Mapper.isEqual(self.result, other.result);

  @override Function get typeFactory => (f) => f<UsersModel>();
}

extension UsersModelMapperExtension  on UsersModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  UsersModelCopyWith<UsersModel> get copyWith => UsersModelCopyWith(this, $identity);
}

abstract class UsersModelCopyWith<$R> {
  factory UsersModelCopyWith(UsersModel value, Then<UsersModel, $R> then) = _UsersModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  ListCopyWith<$R, UserResult, UserResultCopyWith<$R>> get result;
  $R call({bool? status, int? code, CoreError? error, List<UserResult>? result});
  $R apply(UsersModel Function(UsersModel) transform);
}

class _UsersModelCopyWithImpl<$R> extends BaseCopyWith<UsersModel, $R> implements UsersModelCopyWith<$R> {
  _UsersModelCopyWithImpl(UsersModel value, Then<UsersModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override ListCopyWith<$R, UserResult, UserResultCopyWith<$R>> get result => ListCopyWith($value.result, (v, t) => UserResultCopyWith(v, t), (v) => call(result: v));
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none, List<UserResult>? result}) => $then(UsersModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error), result: result ?? $value.result));
}

class UserPatchDtoMapper extends BaseMapper<UserPatchDto> {
  UserPatchDtoMapper._();

  @override Function get decoder => decode;
  UserPatchDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  UserPatchDto fromMap(Map<String, dynamic> map) => UserPatchDto(firstName: Mapper.i.$getOpt(map, 'first_name'), lastName: Mapper.i.$getOpt(map, 'last_name'), password: Mapper.i.$getOpt(map, 'password'), avatarId: Mapper.i.$getOpt(map, 'avatar_id'));

  @override Function get encoder => (UserPatchDto v) => encode(v);
  dynamic encode(UserPatchDto v) => toMap(v);
  Map<String, dynamic> toMap(UserPatchDto u) => {if (Mapper.i.$enc(u.firstName, 'firstName') != null) 'first_name': Mapper.i.$enc(u.firstName, 'firstName'), if (Mapper.i.$enc(u.lastName, 'lastName') != null) 'last_name': Mapper.i.$enc(u.lastName, 'lastName'), if (Mapper.i.$enc(u.password, 'password') != null) 'password': Mapper.i.$enc(u.password, 'password'), if (Mapper.i.$enc(u.avatarId, 'avatarId') != null) 'avatar_id': Mapper.i.$enc(u.avatarId, 'avatarId')};

  @override String stringify(UserPatchDto self) => 'UserPatchDto(firstName: ${Mapper.asString(self.firstName)}, lastName: ${Mapper.asString(self.lastName)}, password: ${Mapper.asString(self.password)}, avatarId: ${Mapper.asString(self.avatarId)})';
  @override int hash(UserPatchDto self) => Mapper.hash(self.firstName) ^ Mapper.hash(self.lastName) ^ Mapper.hash(self.password) ^ Mapper.hash(self.avatarId);
  @override bool equals(UserPatchDto self, UserPatchDto other) => Mapper.isEqual(self.firstName, other.firstName) && Mapper.isEqual(self.lastName, other.lastName) && Mapper.isEqual(self.password, other.password) && Mapper.isEqual(self.avatarId, other.avatarId);

  @override Function get typeFactory => (f) => f<UserPatchDto>();
}

extension UserPatchDtoMapperExtension  on UserPatchDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  UserPatchDtoCopyWith<UserPatchDto> get copyWith => UserPatchDtoCopyWith(this, $identity);
}

abstract class UserPatchDtoCopyWith<$R> {
  factory UserPatchDtoCopyWith(UserPatchDto value, Then<UserPatchDto, $R> then) = _UserPatchDtoCopyWithImpl<$R>;
  $R call({String? firstName, String? lastName, String? password, String? avatarId});
  $R apply(UserPatchDto Function(UserPatchDto) transform);
}

class _UserPatchDtoCopyWithImpl<$R> extends BaseCopyWith<UserPatchDto, $R> implements UserPatchDtoCopyWith<$R> {
  _UserPatchDtoCopyWithImpl(UserPatchDto value, Then<UserPatchDto, $R> then) : super(value, then);

  @override $R call({Object? firstName = $none, Object? lastName = $none, Object? password = $none, Object? avatarId = $none}) => $then(UserPatchDto(firstName: or(firstName, $value.firstName), lastName: or(lastName, $value.lastName), password: or(password, $value.password), avatarId: or(avatarId, $value.avatarId)));
}

class AvatarModelMapper extends BaseMapper<AvatarModel> {
  AvatarModelMapper._();

  @override Function get decoder => decode;
  AvatarModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  AvatarModel fromMap(Map<String, dynamic> map) => AvatarModel(documentId: Mapper.i.$get(map, 'document_id'), url: Mapper.i.$get(map, 'url'));

  @override Function get encoder => (AvatarModel v) => encode(v);
  dynamic encode(AvatarModel v) => toMap(v);
  Map<String, dynamic> toMap(AvatarModel a) => {'document_id': Mapper.i.$enc(a.documentId, 'documentId'), 'url': Mapper.i.$enc(a.url, 'url')};

  @override String stringify(AvatarModel self) => 'AvatarModel(documentId: ${Mapper.asString(self.documentId)}, url: ${Mapper.asString(self.url)})';
  @override int hash(AvatarModel self) => Mapper.hash(self.documentId) ^ Mapper.hash(self.url);
  @override bool equals(AvatarModel self, AvatarModel other) => Mapper.isEqual(self.documentId, other.documentId) && Mapper.isEqual(self.url, other.url);

  @override Function get typeFactory => (f) => f<AvatarModel>();
}

extension AvatarModelMapperExtension  on AvatarModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AvatarModelCopyWith<AvatarModel> get copyWith => AvatarModelCopyWith(this, $identity);
}

abstract class AvatarModelCopyWith<$R> {
  factory AvatarModelCopyWith(AvatarModel value, Then<AvatarModel, $R> then) = _AvatarModelCopyWithImpl<$R>;
  $R call({String? documentId, String? url});
  $R apply(AvatarModel Function(AvatarModel) transform);
}

class _AvatarModelCopyWithImpl<$R> extends BaseCopyWith<AvatarModel, $R> implements AvatarModelCopyWith<$R> {
  _AvatarModelCopyWithImpl(AvatarModel value, Then<AvatarModel, $R> then) : super(value, then);

  @override $R call({String? documentId, String? url}) => $then(AvatarModel(documentId: documentId ?? $value.documentId, url: url ?? $value.url));
}

class DeletedMessageResultMapper extends BaseMapper<DeletedMessageResult> {
  DeletedMessageResultMapper._();

  @override Function get decoder => decode;
  DeletedMessageResult decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  DeletedMessageResult fromMap(Map<String, dynamic> map) => DeletedMessageResult(uuid: Mapper.i.$getOpt(map, 'uuid'));

  @override Function get encoder => (DeletedMessageResult v) => encode(v);
  dynamic encode(DeletedMessageResult v) => toMap(v);
  Map<String, dynamic> toMap(DeletedMessageResult d) => {'uuid': Mapper.i.$enc(d.uuid, 'uuid')};

  @override String stringify(DeletedMessageResult self) => 'DeletedMessageResult(uuid: ${Mapper.asString(self.uuid)})';
  @override int hash(DeletedMessageResult self) => Mapper.hash(self.uuid);
  @override bool equals(DeletedMessageResult self, DeletedMessageResult other) => Mapper.isEqual(self.uuid, other.uuid);

  @override Function get typeFactory => (f) => f<DeletedMessageResult>();
}

extension DeletedMessageResultMapperExtension  on DeletedMessageResult {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DeletedMessageResultCopyWith<DeletedMessageResult> get copyWith => DeletedMessageResultCopyWith(this, $identity);
}

abstract class DeletedMessageResultCopyWith<$R> {
  factory DeletedMessageResultCopyWith(DeletedMessageResult value, Then<DeletedMessageResult, $R> then) = _DeletedMessageResultCopyWithImpl<$R>;
  $R call({String? uuid});
  $R apply(DeletedMessageResult Function(DeletedMessageResult) transform);
}

class _DeletedMessageResultCopyWithImpl<$R> extends BaseCopyWith<DeletedMessageResult, $R> implements DeletedMessageResultCopyWith<$R> {
  _DeletedMessageResultCopyWithImpl(DeletedMessageResult value, Then<DeletedMessageResult, $R> then) : super(value, then);

  @override $R call({Object? uuid = $none}) => $then(DeletedMessageResult(uuid: or(uuid, $value.uuid)));
}

class DeletedMessageModelMapper extends BaseMapper<DeletedMessageModel> {
  DeletedMessageModelMapper._();

  @override Function get decoder => decode;
  DeletedMessageModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  DeletedMessageModel fromMap(Map<String, dynamic> map) => DeletedMessageModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'), result: Mapper.i.$getOpt(map, 'result'));

  @override Function get encoder => (DeletedMessageModel v) => encode(v);
  dynamic encode(DeletedMessageModel v) => toMap(v);
  Map<String, dynamic> toMap(DeletedMessageModel d) => {'status': Mapper.i.$enc(d.status, 'status'), 'code': Mapper.i.$enc(d.code, 'code'), 'error': Mapper.i.$enc(d.error, 'error'), 'result': Mapper.i.$enc(d.result, 'result')};

  @override String stringify(DeletedMessageModel self) => 'DeletedMessageModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)}, result: ${Mapper.asString(self.result)})';
  @override int hash(DeletedMessageModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error) ^ Mapper.hash(self.result);
  @override bool equals(DeletedMessageModel self, DeletedMessageModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error) && Mapper.isEqual(self.result, other.result);

  @override Function get typeFactory => (f) => f<DeletedMessageModel>();
}

extension DeletedMessageModelMapperExtension  on DeletedMessageModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DeletedMessageModelCopyWith<DeletedMessageModel> get copyWith => DeletedMessageModelCopyWith(this, $identity);
}

abstract class DeletedMessageModelCopyWith<$R> {
  factory DeletedMessageModelCopyWith(DeletedMessageModel value, Then<DeletedMessageModel, $R> then) = _DeletedMessageModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  DeletedMessageResultCopyWith<$R>? get result;
  $R call({bool? status, int? code, CoreError? error, DeletedMessageResult? result});
  $R apply(DeletedMessageModel Function(DeletedMessageModel) transform);
}

class _DeletedMessageModelCopyWithImpl<$R> extends BaseCopyWith<DeletedMessageModel, $R> implements DeletedMessageModelCopyWith<$R> {
  _DeletedMessageModelCopyWithImpl(DeletedMessageModel value, Then<DeletedMessageModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override DeletedMessageResultCopyWith<$R>? get result => $value.result != null ? DeletedMessageResultCopyWith($value.result!, (v) => call(result: v)) : null;
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none, Object? result = $none}) => $then(DeletedMessageModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error), result: or(result, $value.result)));
}

class MessageModelMapper extends BaseMapper<MessageModel> {
  MessageModelMapper._();

  @override Function get decoder => decode;
  MessageModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  MessageModel fromMap(Map<String, dynamic> map) => MessageModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'), result: Mapper.i.$getOpt(map, 'result'));

  @override Function get encoder => (MessageModel v) => encode(v);
  dynamic encode(MessageModel v) => toMap(v);
  Map<String, dynamic> toMap(MessageModel m) => {'status': Mapper.i.$enc(m.status, 'status'), 'code': Mapper.i.$enc(m.code, 'code'), 'error': Mapper.i.$enc(m.error, 'error'), 'result': Mapper.i.$enc(m.result, 'result')};

  @override String stringify(MessageModel self) => 'MessageModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)}, result: ${Mapper.asString(self.result)})';
  @override int hash(MessageModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error) ^ Mapper.hash(self.result);
  @override bool equals(MessageModel self, MessageModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error) && Mapper.isEqual(self.result, other.result);

  @override Function get typeFactory => (f) => f<MessageModel>();
}

extension MessageModelMapperExtension  on MessageModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  MessageModelCopyWith<MessageModel> get copyWith => MessageModelCopyWith(this, $identity);
}

abstract class MessageModelCopyWith<$R> {
  factory MessageModelCopyWith(MessageModel value, Then<MessageModel, $R> then) = _MessageModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  MessageResultCopyWith<$R>? get result;
  $R call({bool? status, int? code, CoreError? error, MessageResult? result});
  $R apply(MessageModel Function(MessageModel) transform);
}

class _MessageModelCopyWithImpl<$R> extends BaseCopyWith<MessageModel, $R> implements MessageModelCopyWith<$R> {
  _MessageModelCopyWithImpl(MessageModel value, Then<MessageModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override MessageResultCopyWith<$R>? get result => $value.result != null ? MessageResultCopyWith($value.result!, (v) => call(result: v)) : null;
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none, Object? result = $none}) => $then(MessageModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error), result: or(result, $value.result)));
}

class MessageResultMapper extends BaseMapper<MessageResult> {
  MessageResultMapper._();

  @override Function get decoder => decode;
  MessageResult decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  MessageResult fromMap(Map<String, dynamic> map) => MessageResult(createdAt: Mapper.i.$get(map, 'created_at'), updatedAt: Mapper.i.$getOpt(map, 'updated_at'), uuid: Mapper.i.$getOpt(map, 'uuid'), authorId: Mapper.i.$getOpt(map, 'author_id'), conversationId: Mapper.i.$getOpt(map, 'conversation_id'), replyUuid: Mapper.i.$getOpt(map, 'reply_uuid'), text: Mapper.i.$getOpt(map, 'text'), threadCount: Mapper.i.$getOpt(map, 'thread_count'), author: Mapper.i.$getOpt(map, 'author'), parentId: Mapper.i.$getOpt(map, 'parentId'), documents: Mapper.i.$getOpt(map, 'documents') ?? const []);

  @override Function get encoder => (MessageResult v) => encode(v);
  dynamic encode(MessageResult v) {
    if (v is SocketMessageModel) { return SocketMessageModelMapper._().encode(v); }
    else { return toMap(v); }
  }
  Map<String, dynamic> toMap(MessageResult m) => {'created_at': Mapper.i.$enc(m.createdAt, 'createdAt'), 'updated_at': Mapper.i.$enc(m.updatedAt, 'updatedAt'), 'uuid': Mapper.i.$enc(m.uuid, 'uuid'), 'author_id': Mapper.i.$enc(m.authorId, 'authorId'), 'conversation_id': Mapper.i.$enc(m.conversationId, 'conversationId'), 'reply_uuid': Mapper.i.$enc(m.replyUuid, 'replyUuid'), 'text': Mapper.i.$enc(m.text, 'text'), 'thread_count': Mapper.i.$enc(m.threadCount, 'threadCount'), 'author': Mapper.i.$enc(m.author, 'author'), 'parentId': Mapper.i.$enc(m.parentId, 'parentId'), 'documents': Mapper.i.$enc(m.documents, 'documents')};

  @override String stringify(MessageResult self) => 'MessageResult(createdAt: ${Mapper.asString(self.createdAt)}, updatedAt: ${Mapper.asString(self.updatedAt)}, uuid: ${Mapper.asString(self.uuid)}, authorId: ${Mapper.asString(self.authorId)}, conversationId: ${Mapper.asString(self.conversationId)}, replyUuid: ${Mapper.asString(self.replyUuid)}, text: ${Mapper.asString(self.text)}, threadCount: ${Mapper.asString(self.threadCount)}, author: ${Mapper.asString(self.author)}, parentId: ${Mapper.asString(self.parentId)}, documents: ${Mapper.asString(self.documents)}, documentStats: ${Mapper.asString(self.documentStats)})';
  @override int hash(MessageResult self) => Mapper.hash(self.createdAt) ^ Mapper.hash(self.updatedAt) ^ Mapper.hash(self.uuid) ^ Mapper.hash(self.authorId) ^ Mapper.hash(self.conversationId) ^ Mapper.hash(self.replyUuid) ^ Mapper.hash(self.text) ^ Mapper.hash(self.threadCount) ^ Mapper.hash(self.author) ^ Mapper.hash(self.parentId) ^ Mapper.hash(self.documents) ^ Mapper.hash(self.documentStats);
  @override bool equals(MessageResult self, MessageResult other) => Mapper.isEqual(self.createdAt, other.createdAt) && Mapper.isEqual(self.updatedAt, other.updatedAt) && Mapper.isEqual(self.uuid, other.uuid) && Mapper.isEqual(self.authorId, other.authorId) && Mapper.isEqual(self.conversationId, other.conversationId) && Mapper.isEqual(self.replyUuid, other.replyUuid) && Mapper.isEqual(self.text, other.text) && Mapper.isEqual(self.threadCount, other.threadCount) && Mapper.isEqual(self.author, other.author) && Mapper.isEqual(self.parentId, other.parentId) && Mapper.isEqual(self.documents, other.documents) && Mapper.isEqual(self.documentStats, other.documentStats);

  @override Function get typeFactory => (f) => f<MessageResult>();
}

extension MessageResultMapperExtension  on MessageResult {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  MessageResultCopyWith<MessageResult> get copyWith => MessageResultCopyWith(this, $identity);
}

abstract class MessageResultCopyWith<$R> {
  factory MessageResultCopyWith(MessageResult value, Then<MessageResult, $R> then) = _MessageResultCopyWithImpl<$R>;
  AuthorModelCopyWith<$R>? get author;
  ListCopyWith<$R, DocumentModel, DocumentModelCopyWith<$R>> get documents;
  $R call({DateTime? createdAt, DateTime? updatedAt, String? uuid, String? authorId, String? conversationId, String? replyUuid, String? text, int? threadCount, AuthorModel? author, String? parentId, List<DocumentModel>? documents});
  $R apply(MessageResult Function(MessageResult) transform);
}

class _MessageResultCopyWithImpl<$R> extends BaseCopyWith<MessageResult, $R> implements MessageResultCopyWith<$R> {
  _MessageResultCopyWithImpl(MessageResult value, Then<MessageResult, $R> then) : super(value, then);

  @override AuthorModelCopyWith<$R>? get author => $value.author != null ? AuthorModelCopyWith($value.author!, (v) => call(author: v)) : null;
  @override ListCopyWith<$R, DocumentModel, DocumentModelCopyWith<$R>> get documents => ListCopyWith($value.documents, (v, t) => DocumentModelCopyWith(v, t), (v) => call(documents: v));
  @override $R call({DateTime? createdAt, Object? updatedAt = $none, Object? uuid = $none, Object? authorId = $none, Object? conversationId = $none, Object? replyUuid = $none, Object? text = $none, Object? threadCount = $none, Object? author = $none, Object? parentId = $none, List<DocumentModel>? documents}) => $then(MessageResult(createdAt: createdAt ?? $value.createdAt, updatedAt: or(updatedAt, $value.updatedAt), uuid: or(uuid, $value.uuid), authorId: or(authorId, $value.authorId), conversationId: or(conversationId, $value.conversationId), replyUuid: or(replyUuid, $value.replyUuid), text: or(text, $value.text), threadCount: or(threadCount, $value.threadCount), author: or(author, $value.author), parentId: or(parentId, $value.parentId), documents: documents ?? $value.documents));
}

class MessagesModelMapper extends BaseMapper<MessagesModel> {
  MessagesModelMapper._();

  @override Function get decoder => decode;
  MessagesModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  MessagesModel fromMap(Map<String, dynamic> map) => MessagesModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'), result: Mapper.i.$getOpt(map, 'result') ?? const []);

  @override Function get encoder => (MessagesModel v) => encode(v);
  dynamic encode(MessagesModel v) => toMap(v);
  Map<String, dynamic> toMap(MessagesModel m) => {'status': Mapper.i.$enc(m.status, 'status'), 'code': Mapper.i.$enc(m.code, 'code'), 'error': Mapper.i.$enc(m.error, 'error'), 'result': Mapper.i.$enc(m.result, 'result')};

  @override String stringify(MessagesModel self) => 'MessagesModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)}, result: ${Mapper.asString(self.result)})';
  @override int hash(MessagesModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error) ^ Mapper.hash(self.result);
  @override bool equals(MessagesModel self, MessagesModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error) && Mapper.isEqual(self.result, other.result);

  @override Function get typeFactory => (f) => f<MessagesModel>();
}

extension MessagesModelMapperExtension  on MessagesModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  MessagesModelCopyWith<MessagesModel> get copyWith => MessagesModelCopyWith(this, $identity);
}

abstract class MessagesModelCopyWith<$R> {
  factory MessagesModelCopyWith(MessagesModel value, Then<MessagesModel, $R> then) = _MessagesModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  ListCopyWith<$R, MessageResult, MessageResultCopyWith<$R>> get result;
  $R call({bool? status, int? code, CoreError? error, List<MessageResult>? result});
  $R apply(MessagesModel Function(MessagesModel) transform);
}

class _MessagesModelCopyWithImpl<$R> extends BaseCopyWith<MessagesModel, $R> implements MessagesModelCopyWith<$R> {
  _MessagesModelCopyWithImpl(MessagesModel value, Then<MessagesModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override ListCopyWith<$R, MessageResult, MessageResultCopyWith<$R>> get result => ListCopyWith($value.result, (v, t) => MessageResultCopyWith(v, t), (v) => call(result: v));
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none, List<MessageResult>? result}) => $then(MessagesModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error), result: result ?? $value.result));
}

class PatchMessageDtoMapper extends BaseMapper<PatchMessageDto> {
  PatchMessageDtoMapper._();

  @override Function get decoder => decode;
  PatchMessageDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  PatchMessageDto fromMap(Map<String, dynamic> map) => PatchMessageDto(text: Mapper.i.$getOpt(map, 'text'));

  @override Function get encoder => (PatchMessageDto v) => encode(v);
  dynamic encode(PatchMessageDto v) {
    if (v is SendMessageDto) { return SendMessageDtoMapper._().encode(v); }
    else { return toMap(v); }
  }
  Map<String, dynamic> toMap(PatchMessageDto p) => {'text': Mapper.i.$enc(p.text, 'text')};

  @override String stringify(PatchMessageDto self) => 'PatchMessageDto(text: ${Mapper.asString(self.text)})';
  @override int hash(PatchMessageDto self) => Mapper.hash(self.text);
  @override bool equals(PatchMessageDto self, PatchMessageDto other) => Mapper.isEqual(self.text, other.text);

  @override Function get typeFactory => (f) => f<PatchMessageDto>();
}

extension PatchMessageDtoMapperExtension  on PatchMessageDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  PatchMessageDtoCopyWith<PatchMessageDto> get copyWith => PatchMessageDtoCopyWith(this, $identity);
}

abstract class PatchMessageDtoCopyWith<$R> {
  factory PatchMessageDtoCopyWith(PatchMessageDto value, Then<PatchMessageDto, $R> then) = _PatchMessageDtoCopyWithImpl<$R>;
  $R call({String? text});
  $R apply(PatchMessageDto Function(PatchMessageDto) transform);
}

class _PatchMessageDtoCopyWithImpl<$R> extends BaseCopyWith<PatchMessageDto, $R> implements PatchMessageDtoCopyWith<$R> {
  _PatchMessageDtoCopyWithImpl(PatchMessageDto value, Then<PatchMessageDto, $R> then) : super(value, then);

  @override $R call({Object? text = $none}) => $then(PatchMessageDto(text: or(text, $value.text)));
}

class SendMessageDtoMapper extends BaseMapper<SendMessageDto> {
  SendMessageDtoMapper._();

  @override Function get decoder => decode;
  SendMessageDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SendMessageDto fromMap(Map<String, dynamic> map) => SendMessageDto(replyUuid: Mapper.i.$getOpt(map, 'reply_uuid'), documents: Mapper.i.$getOpt(map, 'documents') ?? const [], text: Mapper.i.$getOpt(map, 'text'));

  @override Function get encoder => (SendMessageDto v) => encode(v);
  dynamic encode(SendMessageDto v) => toMap(v);
  Map<String, dynamic> toMap(SendMessageDto s) => {'reply_uuid': Mapper.i.$enc(s.replyUuid, 'replyUuid'), 'documents': Mapper.i.$enc(s.documents, 'documents'), 'text': Mapper.i.$enc(s.text, 'text')};

  @override String stringify(SendMessageDto self) => 'SendMessageDto(text: ${Mapper.asString(self.text)}, replyUuid: ${Mapper.asString(self.replyUuid)}, documents: ${Mapper.asString(self.documents)})';
  @override int hash(SendMessageDto self) => Mapper.hash(self.text) ^ Mapper.hash(self.replyUuid) ^ Mapper.hash(self.documents);
  @override bool equals(SendMessageDto self, SendMessageDto other) => Mapper.isEqual(self.text, other.text) && Mapper.isEqual(self.replyUuid, other.replyUuid) && Mapper.isEqual(self.documents, other.documents);

  @override Function get typeFactory => (f) => f<SendMessageDto>();
}

extension SendMessageDtoMapperExtension  on SendMessageDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SendMessageDtoCopyWith<SendMessageDto> get copyWith => SendMessageDtoCopyWith(this, $identity);
}

abstract class SendMessageDtoCopyWith<$R> {
  factory SendMessageDtoCopyWith(SendMessageDto value, Then<SendMessageDto, $R> then) = _SendMessageDtoCopyWithImpl<$R>;
  $R call({String? replyUuid, List<String>? documents, String? text});
  $R apply(SendMessageDto Function(SendMessageDto) transform);
}

class _SendMessageDtoCopyWithImpl<$R> extends BaseCopyWith<SendMessageDto, $R> implements SendMessageDtoCopyWith<$R> {
  _SendMessageDtoCopyWithImpl(SendMessageDto value, Then<SendMessageDto, $R> then) : super(value, then);

  @override $R call({Object? replyUuid = $none, List<String>? documents, Object? text = $none}) => $then(SendMessageDto(replyUuid: or(replyUuid, $value.replyUuid), documents: documents ?? $value.documents, text: or(text, $value.text)));
}

class DocumentModelMapper extends BaseMapper<DocumentModel> {
  DocumentModelMapper._();

  @override Function get decoder => decode;
  DocumentModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  DocumentModel fromMap(Map<String, dynamic> map) => DocumentModel(uuid: Mapper.i.$get(map, 'uuid'), documentId: Mapper.i.$get(map, 'document_id'), url: Mapper.i.$get(map, 'url'), meta: Mapper.i.$get(map, 'meta'));

  @override Function get encoder => (DocumentModel v) => encode(v);
  dynamic encode(DocumentModel v) => toMap(v);
  Map<String, dynamic> toMap(DocumentModel d) => {'uuid': Mapper.i.$enc(d.uuid, 'uuid'), 'document_id': Mapper.i.$enc(d.documentId, 'documentId'), 'url': Mapper.i.$enc(d.url, 'url'), 'meta': Mapper.i.$enc(d.meta, 'meta')};

  @override String stringify(DocumentModel self) => 'DocumentModel(uuid: ${Mapper.asString(self.uuid)}, documentId: ${Mapper.asString(self.documentId)}, url: ${Mapper.asString(self.url)}, meta: ${Mapper.asString(self.meta)})';
  @override int hash(DocumentModel self) => Mapper.hash(self.uuid) ^ Mapper.hash(self.documentId) ^ Mapper.hash(self.url) ^ Mapper.hash(self.meta);
  @override bool equals(DocumentModel self, DocumentModel other) => Mapper.isEqual(self.uuid, other.uuid) && Mapper.isEqual(self.documentId, other.documentId) && Mapper.isEqual(self.url, other.url) && Mapper.isEqual(self.meta, other.meta);

  @override Function get typeFactory => (f) => f<DocumentModel>();
}

extension DocumentModelMapperExtension  on DocumentModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DocumentModelCopyWith<DocumentModel> get copyWith => DocumentModelCopyWith(this, $identity);
}

abstract class DocumentModelCopyWith<$R> {
  factory DocumentModelCopyWith(DocumentModel value, Then<DocumentModel, $R> then) = _DocumentModelCopyWithImpl<$R>;
  $R call({String? uuid, String? documentId, String? url, String? meta});
  $R apply(DocumentModel Function(DocumentModel) transform);
}

class _DocumentModelCopyWithImpl<$R> extends BaseCopyWith<DocumentModel, $R> implements DocumentModelCopyWith<$R> {
  _DocumentModelCopyWithImpl(DocumentModel value, Then<DocumentModel, $R> then) : super(value, then);

  @override $R call({String? uuid, String? documentId, String? url, String? meta}) => $then(DocumentModel(uuid: uuid ?? $value.uuid, documentId: documentId ?? $value.documentId, url: url ?? $value.url, meta: meta ?? $value.meta));
}

class SocketDeleteMessageModelMapper extends BaseMapper<SocketDeleteMessageModel> {
  SocketDeleteMessageModelMapper._();

  @override Function get decoder => decode;
  SocketDeleteMessageModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SocketDeleteMessageModel fromMap(Map<String, dynamic> map) => SocketDeleteMessageModel(author: Mapper.i.$getOpt(map, 'author'), conversationId: Mapper.i.$getOpt(map, 'conversation_id'), uuid: Mapper.i.$getOpt(map, 'uuid'), replyUuid: Mapper.i.$getOpt(map, 'reply_uuid'));

  @override Function get encoder => (SocketDeleteMessageModel v) => encode(v);
  dynamic encode(SocketDeleteMessageModel v) => toMap(v);
  Map<String, dynamic> toMap(SocketDeleteMessageModel s) => {'author': Mapper.i.$enc(s.author, 'author'), 'conversation_id': Mapper.i.$enc(s.conversationId, 'conversationId'), 'uuid': Mapper.i.$enc(s.uuid, 'uuid'), 'reply_uuid': Mapper.i.$enc(s.replyUuid, 'replyUuid')};

  @override String stringify(SocketDeleteMessageModel self) => 'SocketDeleteMessageModel(author: ${Mapper.asString(self.author)}, conversationId: ${Mapper.asString(self.conversationId)}, uuid: ${Mapper.asString(self.uuid)}, replyUuid: ${Mapper.asString(self.replyUuid)})';
  @override int hash(SocketDeleteMessageModel self) => Mapper.hash(self.author) ^ Mapper.hash(self.conversationId) ^ Mapper.hash(self.uuid) ^ Mapper.hash(self.replyUuid);
  @override bool equals(SocketDeleteMessageModel self, SocketDeleteMessageModel other) => Mapper.isEqual(self.author, other.author) && Mapper.isEqual(self.conversationId, other.conversationId) && Mapper.isEqual(self.uuid, other.uuid) && Mapper.isEqual(self.replyUuid, other.replyUuid);

  @override Function get typeFactory => (f) => f<SocketDeleteMessageModel>();
}

extension SocketDeleteMessageModelMapperExtension  on SocketDeleteMessageModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SocketDeleteMessageModelCopyWith<SocketDeleteMessageModel> get copyWith => SocketDeleteMessageModelCopyWith(this, $identity);
}

abstract class SocketDeleteMessageModelCopyWith<$R> {
  factory SocketDeleteMessageModelCopyWith(SocketDeleteMessageModel value, Then<SocketDeleteMessageModel, $R> then) = _SocketDeleteMessageModelCopyWithImpl<$R>;
  AuthorModelCopyWith<$R>? get author;
  $R call({AuthorModel? author, String? conversationId, String? uuid, String? replyUuid});
  $R apply(SocketDeleteMessageModel Function(SocketDeleteMessageModel) transform);
}

class _SocketDeleteMessageModelCopyWithImpl<$R> extends BaseCopyWith<SocketDeleteMessageModel, $R> implements SocketDeleteMessageModelCopyWith<$R> {
  _SocketDeleteMessageModelCopyWithImpl(SocketDeleteMessageModel value, Then<SocketDeleteMessageModel, $R> then) : super(value, then);

  @override AuthorModelCopyWith<$R>? get author => $value.author != null ? AuthorModelCopyWith($value.author!, (v) => call(author: v)) : null;
  @override $R call({Object? author = $none, Object? conversationId = $none, Object? uuid = $none, Object? replyUuid = $none}) => $then(SocketDeleteMessageModel(author: or(author, $value.author), conversationId: or(conversationId, $value.conversationId), uuid: or(uuid, $value.uuid), replyUuid: or(replyUuid, $value.replyUuid)));
}

class TypingDtoMapper extends BaseMapper<TypingDto> {
  TypingDtoMapper._();

  @override Function get decoder => decode;
  TypingDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  TypingDto fromMap(Map<String, dynamic> map) => TypingDto(conversationId: Mapper.i.$getOpt(map, 'conversation_id'));

  @override Function get encoder => (TypingDto v) => encode(v);
  dynamic encode(TypingDto v) => toMap(v);
  Map<String, dynamic> toMap(TypingDto t) => {'conversation_id': Mapper.i.$enc(t.conversationId, 'conversationId')};

  @override String stringify(TypingDto self) => 'TypingDto(conversationId: ${Mapper.asString(self.conversationId)})';
  @override int hash(TypingDto self) => Mapper.hash(self.conversationId);
  @override bool equals(TypingDto self, TypingDto other) => Mapper.isEqual(self.conversationId, other.conversationId);

  @override Function get typeFactory => (f) => f<TypingDto>();
}

extension TypingDtoMapperExtension  on TypingDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  TypingDtoCopyWith<TypingDto> get copyWith => TypingDtoCopyWith(this, $identity);
}

abstract class TypingDtoCopyWith<$R> {
  factory TypingDtoCopyWith(TypingDto value, Then<TypingDto, $R> then) = _TypingDtoCopyWithImpl<$R>;
  $R call({String? conversationId});
  $R apply(TypingDto Function(TypingDto) transform);
}

class _TypingDtoCopyWithImpl<$R> extends BaseCopyWith<TypingDto, $R> implements TypingDtoCopyWith<$R> {
  _TypingDtoCopyWithImpl(TypingDto value, Then<TypingDto, $R> then) : super(value, then);

  @override $R call({Object? conversationId = $none}) => $then(TypingDto(conversationId: or(conversationId, $value.conversationId)));
}

class TypingModelMapper extends BaseMapper<TypingModel> {
  TypingModelMapper._();

  @override Function get decoder => decode;
  TypingModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  TypingModel fromMap(Map<String, dynamic> map) => TypingModel(author: Mapper.i.$getOpt(map, 'author'), conversationId: Mapper.i.$getOpt(map, 'conversation_id'), createdAt: Mapper.i.$getOpt(map, 'created_at'));

  @override Function get encoder => (TypingModel v) => encode(v);
  dynamic encode(TypingModel v) => toMap(v);
  Map<String, dynamic> toMap(TypingModel t) => {'author': Mapper.i.$enc(t.author, 'author'), 'conversation_id': Mapper.i.$enc(t.conversationId, 'conversationId'), 'created_at': Mapper.i.$enc(t.createdAt, 'createdAt')};

  @override String stringify(TypingModel self) => 'TypingModel(author: ${Mapper.asString(self.author)}, conversationId: ${Mapper.asString(self.conversationId)}, createdAt: ${Mapper.asString(self.createdAt)})';
  @override int hash(TypingModel self) => Mapper.hash(self.author) ^ Mapper.hash(self.conversationId) ^ Mapper.hash(self.createdAt);
  @override bool equals(TypingModel self, TypingModel other) => Mapper.isEqual(self.author, other.author) && Mapper.isEqual(self.conversationId, other.conversationId) && Mapper.isEqual(self.createdAt, other.createdAt);

  @override Function get typeFactory => (f) => f<TypingModel>();
}

extension TypingModelMapperExtension  on TypingModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  TypingModelCopyWith<TypingModel> get copyWith => TypingModelCopyWith(this, $identity);
}

abstract class TypingModelCopyWith<$R> {
  factory TypingModelCopyWith(TypingModel value, Then<TypingModel, $R> then) = _TypingModelCopyWithImpl<$R>;
  AuthorModelCopyWith<$R>? get author;
  $R call({AuthorModel? author, String? conversationId, DateTime? createdAt});
  $R apply(TypingModel Function(TypingModel) transform);
}

class _TypingModelCopyWithImpl<$R> extends BaseCopyWith<TypingModel, $R> implements TypingModelCopyWith<$R> {
  _TypingModelCopyWithImpl(TypingModel value, Then<TypingModel, $R> then) : super(value, then);

  @override AuthorModelCopyWith<$R>? get author => $value.author != null ? AuthorModelCopyWith($value.author!, (v) => call(author: v)) : null;
  @override $R call({Object? author = $none, Object? conversationId = $none, Object? createdAt = $none}) => $then(TypingModel(author: or(author, $value.author), conversationId: or(conversationId, $value.conversationId), createdAt: or(createdAt, $value.createdAt)));
}

class SocketMessageModelMapper extends BaseMapper<SocketMessageModel> {
  SocketMessageModelMapper._();

  @override Function get decoder => decode;
  SocketMessageModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SocketMessageModel fromMap(Map<String, dynamic> map) => SocketMessageModel(uuid: Mapper.i.$getOpt(map, 'uuid'), updatedAt: Mapper.i.$getOpt(map, 'updated_at'), threadCount: Mapper.i.$getOpt(map, 'thread_count'), text: Mapper.i.$getOpt(map, 'text'), replyUuid: Mapper.i.$getOpt(map, 'reply_uuid'), createdAt: Mapper.i.$get(map, 'created_at'), conversationId: Mapper.i.$getOpt(map, 'conversation_id'), authorId: Mapper.i.$getOpt(map, 'author_id'), author: Mapper.i.$getOpt(map, 'author'), parentId: Mapper.i.$getOpt(map, 'parentId'), documents: Mapper.i.$getOpt(map, 'documents') ?? const []);

  @override Function get encoder => (SocketMessageModel v) => encode(v);
  dynamic encode(SocketMessageModel v) => toMap(v);
  Map<String, dynamic> toMap(SocketMessageModel s) => {'uuid': Mapper.i.$enc(s.uuid, 'uuid'), 'updated_at': Mapper.i.$enc(s.updatedAt, 'updatedAt'), 'thread_count': Mapper.i.$enc(s.threadCount, 'threadCount'), 'text': Mapper.i.$enc(s.text, 'text'), 'reply_uuid': Mapper.i.$enc(s.replyUuid, 'replyUuid'), 'created_at': Mapper.i.$enc(s.createdAt, 'createdAt'), 'conversation_id': Mapper.i.$enc(s.conversationId, 'conversationId'), 'author_id': Mapper.i.$enc(s.authorId, 'authorId'), 'author': Mapper.i.$enc(s.author, 'author'), 'parentId': Mapper.i.$enc(s.parentId, 'parentId'), 'documents': Mapper.i.$enc(s.documents, 'documents')};

  @override String stringify(SocketMessageModel self) => 'SocketMessageModel(createdAt: ${Mapper.asString(self.createdAt)}, updatedAt: ${Mapper.asString(self.updatedAt)}, uuid: ${Mapper.asString(self.uuid)}, authorId: ${Mapper.asString(self.authorId)}, conversationId: ${Mapper.asString(self.conversationId)}, replyUuid: ${Mapper.asString(self.replyUuid)}, text: ${Mapper.asString(self.text)}, threadCount: ${Mapper.asString(self.threadCount)}, author: ${Mapper.asString(self.author)}, parentId: ${Mapper.asString(self.parentId)}, documents: ${Mapper.asString(self.documents)}, documentStats: ${Mapper.asString(self.documentStats)})';
  @override int hash(SocketMessageModel self) => Mapper.hash(self.createdAt) ^ Mapper.hash(self.updatedAt) ^ Mapper.hash(self.uuid) ^ Mapper.hash(self.authorId) ^ Mapper.hash(self.conversationId) ^ Mapper.hash(self.replyUuid) ^ Mapper.hash(self.text) ^ Mapper.hash(self.threadCount) ^ Mapper.hash(self.author) ^ Mapper.hash(self.parentId) ^ Mapper.hash(self.documents) ^ Mapper.hash(self.documentStats);
  @override bool equals(SocketMessageModel self, SocketMessageModel other) => Mapper.isEqual(self.createdAt, other.createdAt) && Mapper.isEqual(self.updatedAt, other.updatedAt) && Mapper.isEqual(self.uuid, other.uuid) && Mapper.isEqual(self.authorId, other.authorId) && Mapper.isEqual(self.conversationId, other.conversationId) && Mapper.isEqual(self.replyUuid, other.replyUuid) && Mapper.isEqual(self.text, other.text) && Mapper.isEqual(self.threadCount, other.threadCount) && Mapper.isEqual(self.author, other.author) && Mapper.isEqual(self.parentId, other.parentId) && Mapper.isEqual(self.documents, other.documents) && Mapper.isEqual(self.documentStats, other.documentStats);

  @override Function get typeFactory => (f) => f<SocketMessageModel>();
}

extension SocketMessageModelMapperExtension  on SocketMessageModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SocketMessageModelCopyWith<SocketMessageModel> get copyWith => SocketMessageModelCopyWith(this, $identity);
}

abstract class SocketMessageModelCopyWith<$R> {
  factory SocketMessageModelCopyWith(SocketMessageModel value, Then<SocketMessageModel, $R> then) = _SocketMessageModelCopyWithImpl<$R>;
  AuthorModelCopyWith<$R>? get author;
  ListCopyWith<$R, DocumentModel, DocumentModelCopyWith<$R>> get documents;
  $R call({String? uuid, DateTime? updatedAt, int? threadCount, String? text, String? replyUuid, DateTime? createdAt, String? conversationId, String? authorId, AuthorModel? author, String? parentId, List<DocumentModel>? documents});
  $R apply(SocketMessageModel Function(SocketMessageModel) transform);
}

class _SocketMessageModelCopyWithImpl<$R> extends BaseCopyWith<SocketMessageModel, $R> implements SocketMessageModelCopyWith<$R> {
  _SocketMessageModelCopyWithImpl(SocketMessageModel value, Then<SocketMessageModel, $R> then) : super(value, then);

  @override AuthorModelCopyWith<$R>? get author => $value.author != null ? AuthorModelCopyWith($value.author!, (v) => call(author: v)) : null;
  @override ListCopyWith<$R, DocumentModel, DocumentModelCopyWith<$R>> get documents => ListCopyWith($value.documents, (v, t) => DocumentModelCopyWith(v, t), (v) => call(documents: v));
  @override $R call({Object? uuid = $none, Object? updatedAt = $none, Object? threadCount = $none, Object? text = $none, Object? replyUuid = $none, DateTime? createdAt, Object? conversationId = $none, Object? authorId = $none, Object? author = $none, Object? parentId = $none, List<DocumentModel>? documents}) => $then(SocketMessageModel(uuid: or(uuid, $value.uuid), updatedAt: or(updatedAt, $value.updatedAt), threadCount: or(threadCount, $value.threadCount), text: or(text, $value.text), replyUuid: or(replyUuid, $value.replyUuid), createdAt: createdAt ?? $value.createdAt, conversationId: or(conversationId, $value.conversationId), authorId: or(authorId, $value.authorId), author: or(author, $value.author), parentId: or(parentId, $value.parentId), documents: documents ?? $value.documents));
}

class ChatModelMapper extends BaseMapper<ChatModel> {
  ChatModelMapper._();

  @override Function get decoder => decode;
  ChatModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  ChatModel fromMap(Map<String, dynamic> map) => ChatModel(status: Mapper.i.$getOpt(map, 'status'), createAt: Mapper.i.$getOpt(map, 'created_at'), updatedAt: Mapper.i.$getOpt(map, 'updated_at'), uuid: Mapper.i.$getOpt(map, 'uuid'), documentId: Mapper.i.$getOpt(map, 'document_id'), title: Mapper.i.$getOpt(map, 'title'), statusId: Mapper.i.$getOpt(map, 'status_id'), document: Mapper.i.$getOpt(map, 'document'), conversation: Mapper.i.$getOpt(map, 'conversation') ?? const []);

  @override Function get encoder => (ChatModel v) => encode(v);
  dynamic encode(ChatModel v) => toMap(v);
  Map<String, dynamic> toMap(ChatModel c) => {'status': Mapper.i.$enc(c.status, 'status'), 'created_at': Mapper.i.$enc(c.createAt, 'createAt'), 'updated_at': Mapper.i.$enc(c.updatedAt, 'updatedAt'), 'uuid': Mapper.i.$enc(c.uuid, 'uuid'), 'document_id': Mapper.i.$enc(c.documentId, 'documentId'), 'title': Mapper.i.$enc(c.title, 'title'), 'status_id': Mapper.i.$enc(c.statusId, 'statusId'), 'document': Mapper.i.$enc(c.document, 'document'), 'conversation': Mapper.i.$enc(c.conversation, 'conversation')};

  @override String stringify(ChatModel self) => 'ChatModel(status: ${Mapper.asString(self.status)}, createAt: ${Mapper.asString(self.createAt)}, updatedAt: ${Mapper.asString(self.updatedAt)}, uuid: ${Mapper.asString(self.uuid)}, documentId: ${Mapper.asString(self.documentId)}, title: ${Mapper.asString(self.title)}, statusId: ${Mapper.asString(self.statusId)}, document: ${Mapper.asString(self.document)}, conversation: ${Mapper.asString(self.conversation)})';
  @override int hash(ChatModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.createAt) ^ Mapper.hash(self.updatedAt) ^ Mapper.hash(self.uuid) ^ Mapper.hash(self.documentId) ^ Mapper.hash(self.title) ^ Mapper.hash(self.statusId) ^ Mapper.hash(self.document) ^ Mapper.hash(self.conversation);
  @override bool equals(ChatModel self, ChatModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.createAt, other.createAt) && Mapper.isEqual(self.updatedAt, other.updatedAt) && Mapper.isEqual(self.uuid, other.uuid) && Mapper.isEqual(self.documentId, other.documentId) && Mapper.isEqual(self.title, other.title) && Mapper.isEqual(self.statusId, other.statusId) && Mapper.isEqual(self.document, other.document) && Mapper.isEqual(self.conversation, other.conversation);

  @override Function get typeFactory => (f) => f<ChatModel>();
}

extension ChatModelMapperExtension  on ChatModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ChatModelCopyWith<ChatModel> get copyWith => ChatModelCopyWith(this, $identity);
}

abstract class ChatModelCopyWith<$R> {
  factory ChatModelCopyWith(ChatModel value, Then<ChatModel, $R> then) = _ChatModelCopyWithImpl<$R>;
  StatusModelCopyWith<$R>? get status;
  $R call({StatusModel? status, DateTime? createAt, DateTime? updatedAt, String? uuid, String? documentId, String? title, String? statusId, String? document, List<String>? conversation});
  $R apply(ChatModel Function(ChatModel) transform);
}

class _ChatModelCopyWithImpl<$R> extends BaseCopyWith<ChatModel, $R> implements ChatModelCopyWith<$R> {
  _ChatModelCopyWithImpl(ChatModel value, Then<ChatModel, $R> then) : super(value, then);

  @override StatusModelCopyWith<$R>? get status => $value.status != null ? StatusModelCopyWith($value.status!, (v) => call(status: v)) : null;
  @override $R call({Object? status = $none, Object? createAt = $none, Object? updatedAt = $none, Object? uuid = $none, Object? documentId = $none, Object? title = $none, Object? statusId = $none, Object? document = $none, List<String>? conversation}) => $then(ChatModel(status: or(status, $value.status), createAt: or(createAt, $value.createAt), updatedAt: or(updatedAt, $value.updatedAt), uuid: or(uuid, $value.uuid), documentId: or(documentId, $value.documentId), title: or(title, $value.title), statusId: or(statusId, $value.statusId), document: or(document, $value.document), conversation: conversation ?? $value.conversation));
}

class ChatResultMapper extends BaseMapper<ChatResult> {
  ChatResultMapper._();

  @override Function get decoder => decode;
  ChatResult decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  ChatResult fromMap(Map<String, dynamic> map) => ChatResult(createdAt: Mapper.i.$getOpt(map, 'created_at'), updatedAt: Mapper.i.$getOpt(map, 'updated_at'), uuid: Mapper.i.$getOpt(map, 'uuid'), typeId: Mapper.i.$getOpt(map, 'type_id'), companion: Mapper.i.$getOpt(map, 'companion'), chatId: Mapper.i.$getOpt(map, 'chat_id'), chatType: Mapper.i.$getOpt(map, 'chat_type'), chat: Mapper.i.$getOpt(map, 'chat'));

  @override Function get encoder => (ChatResult v) => encode(v);
  dynamic encode(ChatResult v) => toMap(v);
  Map<String, dynamic> toMap(ChatResult c) => {'created_at': Mapper.i.$enc(c.createdAt, 'createdAt'), 'updated_at': Mapper.i.$enc(c.updatedAt, 'updatedAt'), 'uuid': Mapper.i.$enc(c.uuid, 'uuid'), 'type_id': Mapper.i.$enc(c.typeId, 'typeId'), 'companion': Mapper.i.$enc(c.companion, 'companion'), 'chat_id': Mapper.i.$enc(c.chatId, 'chatId'), 'chat_type': Mapper.i.$enc(c.chatType, 'chatType'), 'chat': Mapper.i.$enc(c.chat, 'chat')};

  @override String stringify(ChatResult self) => 'ChatResult(createdAt: ${Mapper.asString(self.createdAt)}, updatedAt: ${Mapper.asString(self.updatedAt)}, uuid: ${Mapper.asString(self.uuid)}, typeId: ${Mapper.asString(self.typeId)}, companion: ${Mapper.asString(self.companion)}, chatId: ${Mapper.asString(self.chatId)}, chatType: ${Mapper.asString(self.chatType)}, chat: ${Mapper.asString(self.chat)})';
  @override int hash(ChatResult self) => Mapper.hash(self.createdAt) ^ Mapper.hash(self.updatedAt) ^ Mapper.hash(self.uuid) ^ Mapper.hash(self.typeId) ^ Mapper.hash(self.companion) ^ Mapper.hash(self.chatId) ^ Mapper.hash(self.chatType) ^ Mapper.hash(self.chat);
  @override bool equals(ChatResult self, ChatResult other) => Mapper.isEqual(self.createdAt, other.createdAt) && Mapper.isEqual(self.updatedAt, other.updatedAt) && Mapper.isEqual(self.uuid, other.uuid) && Mapper.isEqual(self.typeId, other.typeId) && Mapper.isEqual(self.companion, other.companion) && Mapper.isEqual(self.chatId, other.chatId) && Mapper.isEqual(self.chatType, other.chatType) && Mapper.isEqual(self.chat, other.chat);

  @override Function get typeFactory => (f) => f<ChatResult>();
}

extension ChatResultMapperExtension  on ChatResult {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ChatResultCopyWith<ChatResult> get copyWith => ChatResultCopyWith(this, $identity);
}

abstract class ChatResultCopyWith<$R> {
  factory ChatResultCopyWith(ChatResult value, Then<ChatResult, $R> then) = _ChatResultCopyWithImpl<$R>;
  AuthorModelCopyWith<$R>? get companion;
  ChatTypeCopyWith<$R>? get chatType;
  ChatModelCopyWith<$R>? get chat;
  $R call({DateTime? createdAt, DateTime? updatedAt, String? uuid, int? typeId, AuthorModel? companion, String? chatId, ChatType? chatType, ChatModel? chat});
  $R apply(ChatResult Function(ChatResult) transform);
}

class _ChatResultCopyWithImpl<$R> extends BaseCopyWith<ChatResult, $R> implements ChatResultCopyWith<$R> {
  _ChatResultCopyWithImpl(ChatResult value, Then<ChatResult, $R> then) : super(value, then);

  @override AuthorModelCopyWith<$R>? get companion => $value.companion != null ? AuthorModelCopyWith($value.companion!, (v) => call(companion: v)) : null;
  @override ChatTypeCopyWith<$R>? get chatType => $value.chatType != null ? ChatTypeCopyWith($value.chatType!, (v) => call(chatType: v)) : null;
  @override ChatModelCopyWith<$R>? get chat => $value.chat != null ? ChatModelCopyWith($value.chat!, (v) => call(chat: v)) : null;
  @override $R call({Object? createdAt = $none, Object? updatedAt = $none, Object? uuid = $none, Object? typeId = $none, Object? companion = $none, Object? chatId = $none, Object? chatType = $none, Object? chat = $none}) => $then(ChatResult(createdAt: or(createdAt, $value.createdAt), updatedAt: or(updatedAt, $value.updatedAt), uuid: or(uuid, $value.uuid), typeId: or(typeId, $value.typeId), companion: or(companion, $value.companion), chatId: or(chatId, $value.chatId), chatType: or(chatType, $value.chatType), chat: or(chat, $value.chat)));
}

class ChatTypeMapper extends BaseMapper<ChatType> {
  ChatTypeMapper._();

  @override Function get decoder => decode;
  ChatType decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  ChatType fromMap(Map<String, dynamic> map) => ChatType(id: Mapper.i.$getOpt(map, 'id'), name: Mapper.i.$getOpt(map, 'name'));

  @override Function get encoder => (ChatType v) => encode(v);
  dynamic encode(ChatType v) => toMap(v);
  Map<String, dynamic> toMap(ChatType c) => {'id': Mapper.i.$enc(c.id, 'id'), 'name': Mapper.i.$enc(c.name, 'name')};

  @override String stringify(ChatType self) => 'ChatType(id: ${Mapper.asString(self.id)}, name: ${Mapper.asString(self.name)})';
  @override int hash(ChatType self) => Mapper.hash(self.id) ^ Mapper.hash(self.name);
  @override bool equals(ChatType self, ChatType other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => (f) => f<ChatType>();
}

extension ChatTypeMapperExtension  on ChatType {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ChatTypeCopyWith<ChatType> get copyWith => ChatTypeCopyWith(this, $identity);
}

abstract class ChatTypeCopyWith<$R> {
  factory ChatTypeCopyWith(ChatType value, Then<ChatType, $R> then) = _ChatTypeCopyWithImpl<$R>;
  $R call({int? id, String? name});
  $R apply(ChatType Function(ChatType) transform);
}

class _ChatTypeCopyWithImpl<$R> extends BaseCopyWith<ChatType, $R> implements ChatTypeCopyWith<$R> {
  _ChatTypeCopyWithImpl(ChatType value, Then<ChatType, $R> then) : super(value, then);

  @override $R call({Object? id = $none, Object? name = $none}) => $then(ChatType(id: or(id, $value.id), name: or(name, $value.name)));
}

class ChatsModelMapper extends BaseMapper<ChatsModel> {
  ChatsModelMapper._();

  @override Function get decoder => decode;
  ChatsModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  ChatsModel fromMap(Map<String, dynamic> map) => ChatsModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'), result: Mapper.i.$getOpt(map, 'result') ?? const []);

  @override Function get encoder => (ChatsModel v) => encode(v);
  dynamic encode(ChatsModel v) => toMap(v);
  Map<String, dynamic> toMap(ChatsModel c) => {'status': Mapper.i.$enc(c.status, 'status'), 'code': Mapper.i.$enc(c.code, 'code'), 'error': Mapper.i.$enc(c.error, 'error'), 'result': Mapper.i.$enc(c.result, 'result')};

  @override String stringify(ChatsModel self) => 'ChatsModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)}, result: ${Mapper.asString(self.result)})';
  @override int hash(ChatsModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error) ^ Mapper.hash(self.result);
  @override bool equals(ChatsModel self, ChatsModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error) && Mapper.isEqual(self.result, other.result);

  @override Function get typeFactory => (f) => f<ChatsModel>();
}

extension ChatsModelMapperExtension  on ChatsModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ChatsModelCopyWith<ChatsModel> get copyWith => ChatsModelCopyWith(this, $identity);
}

abstract class ChatsModelCopyWith<$R> {
  factory ChatsModelCopyWith(ChatsModel value, Then<ChatsModel, $R> then) = _ChatsModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  ListCopyWith<$R, ChatResult, ChatResultCopyWith<$R>> get result;
  $R call({bool? status, int? code, CoreError? error, List<ChatResult>? result});
  $R apply(ChatsModel Function(ChatsModel) transform);
}

class _ChatsModelCopyWithImpl<$R> extends BaseCopyWith<ChatsModel, $R> implements ChatsModelCopyWith<$R> {
  _ChatsModelCopyWithImpl(ChatsModel value, Then<ChatsModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override ListCopyWith<$R, ChatResult, ChatResultCopyWith<$R>> get result => ListCopyWith($value.result, (v, t) => ChatResultCopyWith(v, t), (v) => call(result: v));
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none, List<ChatResult>? result}) => $then(ChatsModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error), result: result ?? $value.result));
}

class StatusModelMapper extends BaseMapper<StatusModel> {
  StatusModelMapper._();

  @override Function get decoder => decode;
  StatusModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  StatusModel fromMap(Map<String, dynamic> map) => StatusModel(id: Mapper.i.$getOpt(map, 'id'), title: Mapper.i.$getOpt(map, 'title'));

  @override Function get encoder => (StatusModel v) => encode(v);
  dynamic encode(StatusModel v) => toMap(v);
  Map<String, dynamic> toMap(StatusModel s) => {'id': Mapper.i.$enc(s.id, 'id'), 'title': Mapper.i.$enc(s.title, 'title')};

  @override String stringify(StatusModel self) => 'StatusModel(id: ${Mapper.asString(self.id)}, title: ${Mapper.asString(self.title)})';
  @override int hash(StatusModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.title);
  @override bool equals(StatusModel self, StatusModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.title, other.title);

  @override Function get typeFactory => (f) => f<StatusModel>();
}

extension StatusModelMapperExtension  on StatusModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  StatusModelCopyWith<StatusModel> get copyWith => StatusModelCopyWith(this, $identity);
}

abstract class StatusModelCopyWith<$R> {
  factory StatusModelCopyWith(StatusModel value, Then<StatusModel, $R> then) = _StatusModelCopyWithImpl<$R>;
  $R call({int? id, String? title});
  $R apply(StatusModel Function(StatusModel) transform);
}

class _StatusModelCopyWithImpl<$R> extends BaseCopyWith<StatusModel, $R> implements StatusModelCopyWith<$R> {
  _StatusModelCopyWithImpl(StatusModel value, Then<StatusModel, $R> then) : super(value, then);

  @override $R call({Object? id = $none, Object? title = $none}) => $then(StatusModel(id: or(id, $value.id), title: or(title, $value.title)));
}

class ChatDtoMapper extends BaseMapper<ChatDto> {
  ChatDtoMapper._();

  @override Function get decoder => decode;
  ChatDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  ChatDto fromMap(Map<String, dynamic> map) => ChatDto(type: Mapper.i.$get(map, 'type'), companion: Mapper.i.$getOpt(map, 'companion'), chat: Mapper.i.$getOpt(map, 'chat'));

  @override Function get encoder => (ChatDto v) => encode(v);
  dynamic encode(ChatDto v) => toMap(v);
  Map<String, dynamic> toMap(ChatDto c) => {'type': Mapper.i.$enc(c.type, 'type'), 'companion': Mapper.i.$enc(c.companion, 'companion'), 'chat': Mapper.i.$enc(c.chat, 'chat')};

  @override String stringify(ChatDto self) => 'ChatDto(type: ${Mapper.asString(self.type)}, companion: ${Mapper.asString(self.companion)}, chat: ${Mapper.asString(self.chat)})';
  @override int hash(ChatDto self) => Mapper.hash(self.type) ^ Mapper.hash(self.companion) ^ Mapper.hash(self.chat);
  @override bool equals(ChatDto self, ChatDto other) => Mapper.isEqual(self.type, other.type) && Mapper.isEqual(self.companion, other.companion) && Mapper.isEqual(self.chat, other.chat);

  @override Function get typeFactory => (f) => f<ChatDto>();
}

extension ChatDtoMapperExtension  on ChatDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ChatDtoCopyWith<ChatDto> get copyWith => ChatDtoCopyWith(this, $identity);
}

abstract class ChatDtoCopyWith<$R> {
  factory ChatDtoCopyWith(ChatDto value, Then<ChatDto, $R> then) = _ChatDtoCopyWithImpl<$R>;
  CompanionModelCopyWith<$R>? get companion;
  ChatCreatorCopyWith<$R>? get chat;
  $R call({String? type, CompanionModel? companion, ChatCreator? chat});
  $R apply(ChatDto Function(ChatDto) transform);
}

class _ChatDtoCopyWithImpl<$R> extends BaseCopyWith<ChatDto, $R> implements ChatDtoCopyWith<$R> {
  _ChatDtoCopyWithImpl(ChatDto value, Then<ChatDto, $R> then) : super(value, then);

  @override CompanionModelCopyWith<$R>? get companion => $value.companion != null ? CompanionModelCopyWith($value.companion!, (v) => call(companion: v)) : null;
  @override ChatCreatorCopyWith<$R>? get chat => $value.chat != null ? ChatCreatorCopyWith($value.chat!, (v) => call(chat: v)) : null;
  @override $R call({String? type, Object? companion = $none, Object? chat = $none}) => $then(ChatDto(type: type ?? $value.type, companion: or(companion, $value.companion), chat: or(chat, $value.chat)));
}

class ChatCreatorMapper extends BaseMapper<ChatCreator> {
  ChatCreatorMapper._();

  @override Function get decoder => decode;
  ChatCreator decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  ChatCreator fromMap(Map<String, dynamic> map) => ChatCreator(title: Mapper.i.$get(map, 'title'));

  @override Function get encoder => (ChatCreator v) => encode(v);
  dynamic encode(ChatCreator v) => toMap(v);
  Map<String, dynamic> toMap(ChatCreator c) => {'title': Mapper.i.$enc(c.title, 'title')};

  @override String stringify(ChatCreator self) => 'ChatCreator(title: ${Mapper.asString(self.title)})';
  @override int hash(ChatCreator self) => Mapper.hash(self.title);
  @override bool equals(ChatCreator self, ChatCreator other) => Mapper.isEqual(self.title, other.title);

  @override Function get typeFactory => (f) => f<ChatCreator>();
}

extension ChatCreatorMapperExtension  on ChatCreator {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ChatCreatorCopyWith<ChatCreator> get copyWith => ChatCreatorCopyWith(this, $identity);
}

abstract class ChatCreatorCopyWith<$R> {
  factory ChatCreatorCopyWith(ChatCreator value, Then<ChatCreator, $R> then) = _ChatCreatorCopyWithImpl<$R>;
  $R call({String? title});
  $R apply(ChatCreator Function(ChatCreator) transform);
}

class _ChatCreatorCopyWithImpl<$R> extends BaseCopyWith<ChatCreator, $R> implements ChatCreatorCopyWith<$R> {
  _ChatCreatorCopyWithImpl(ChatCreator value, Then<ChatCreator, $R> then) : super(value, then);

  @override $R call({String? title}) => $then(ChatCreator(title: title ?? $value.title));
}

class CreateChatsModelMapper extends BaseMapper<CreateChatsModel> {
  CreateChatsModelMapper._();

  @override Function get decoder => decode;
  CreateChatsModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  CreateChatsModel fromMap(Map<String, dynamic> map) => CreateChatsModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'), result: Mapper.i.$getOpt(map, 'result'));

  @override Function get encoder => (CreateChatsModel v) => encode(v);
  dynamic encode(CreateChatsModel v) => toMap(v);
  Map<String, dynamic> toMap(CreateChatsModel c) => {'status': Mapper.i.$enc(c.status, 'status'), 'code': Mapper.i.$enc(c.code, 'code'), 'error': Mapper.i.$enc(c.error, 'error'), 'result': Mapper.i.$enc(c.result, 'result')};

  @override String stringify(CreateChatsModel self) => 'CreateChatsModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)}, result: ${Mapper.asString(self.result)})';
  @override int hash(CreateChatsModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error) ^ Mapper.hash(self.result);
  @override bool equals(CreateChatsModel self, CreateChatsModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error) && Mapper.isEqual(self.result, other.result);

  @override Function get typeFactory => (f) => f<CreateChatsModel>();
}

extension CreateChatsModelMapperExtension  on CreateChatsModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CreateChatsModelCopyWith<CreateChatsModel> get copyWith => CreateChatsModelCopyWith(this, $identity);
}

abstract class CreateChatsModelCopyWith<$R> {
  factory CreateChatsModelCopyWith(CreateChatsModel value, Then<CreateChatsModel, $R> then) = _CreateChatsModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  ChatResultCopyWith<$R>? get result;
  $R call({bool? status, int? code, CoreError? error, ChatResult? result});
  $R apply(CreateChatsModel Function(CreateChatsModel) transform);
}

class _CreateChatsModelCopyWithImpl<$R> extends BaseCopyWith<CreateChatsModel, $R> implements CreateChatsModelCopyWith<$R> {
  _CreateChatsModelCopyWithImpl(CreateChatsModel value, Then<CreateChatsModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override ChatResultCopyWith<$R>? get result => $value.result != null ? ChatResultCopyWith($value.result!, (v) => call(result: v)) : null;
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none, Object? result = $none}) => $then(CreateChatsModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error), result: or(result, $value.result)));
}

class DashContentResultMapper extends BaseMapper<DashContentResult> {
  DashContentResultMapper._();

  @override Function get decoder => decode;
  DashContentResult decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  DashContentResult fromMap(Map<String, dynamic> map) => DashContentResult(id: Mapper.i.$getOpt(map, 'id'), title: Mapper.i.$getOpt(map, 'title'), description: Mapper.i.$getOpt(map, 'description'), content: Mapper.i.$getOpt(map, 'content'), authorId: Mapper.i.$getOpt(map, 'authorId'), previewId: Mapper.i.$getOpt(map, 'previewId'), previewLink: Mapper.i.$getOpt(map, 'previewLink'));

  @override Function get encoder => (DashContentResult v) => encode(v);
  dynamic encode(DashContentResult v) => toMap(v);
  Map<String, dynamic> toMap(DashContentResult d) => {if (Mapper.i.$enc(d.id, 'id') != null) 'id': Mapper.i.$enc(d.id, 'id'), if (Mapper.i.$enc(d.title, 'title') != null) 'title': Mapper.i.$enc(d.title, 'title'), if (Mapper.i.$enc(d.description, 'description') != null) 'description': Mapper.i.$enc(d.description, 'description'), if (Mapper.i.$enc(d.content, 'content') != null) 'content': Mapper.i.$enc(d.content, 'content'), if (Mapper.i.$enc(d.authorId, 'authorId') != null) 'authorId': Mapper.i.$enc(d.authorId, 'authorId'), if (Mapper.i.$enc(d.previewId, 'previewId') != null) 'previewId': Mapper.i.$enc(d.previewId, 'previewId'), if (Mapper.i.$enc(d.previewLink, 'previewLink') != null) 'previewLink': Mapper.i.$enc(d.previewLink, 'previewLink')};

  @override String stringify(DashContentResult self) => 'DashContentResult(id: ${Mapper.asString(self.id)}, title: ${Mapper.asString(self.title)}, description: ${Mapper.asString(self.description)}, content: ${Mapper.asString(self.content)}, authorId: ${Mapper.asString(self.authorId)}, previewId: ${Mapper.asString(self.previewId)}, previewLink: ${Mapper.asString(self.previewLink)})';
  @override int hash(DashContentResult self) => Mapper.hash(self.id) ^ Mapper.hash(self.title) ^ Mapper.hash(self.description) ^ Mapper.hash(self.content) ^ Mapper.hash(self.authorId) ^ Mapper.hash(self.previewId) ^ Mapper.hash(self.previewLink);
  @override bool equals(DashContentResult self, DashContentResult other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.title, other.title) && Mapper.isEqual(self.description, other.description) && Mapper.isEqual(self.content, other.content) && Mapper.isEqual(self.authorId, other.authorId) && Mapper.isEqual(self.previewId, other.previewId) && Mapper.isEqual(self.previewLink, other.previewLink);

  @override Function get typeFactory => (f) => f<DashContentResult>();
}

extension DashContentResultMapperExtension  on DashContentResult {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DashContentResultCopyWith<DashContentResult> get copyWith => DashContentResultCopyWith(this, $identity);
}

abstract class DashContentResultCopyWith<$R> {
  factory DashContentResultCopyWith(DashContentResult value, Then<DashContentResult, $R> then) = _DashContentResultCopyWithImpl<$R>;
  $R call({String? id, String? title, String? description, String? content, String? authorId, String? previewId, String? previewLink});
  $R apply(DashContentResult Function(DashContentResult) transform);
}

class _DashContentResultCopyWithImpl<$R> extends BaseCopyWith<DashContentResult, $R> implements DashContentResultCopyWith<$R> {
  _DashContentResultCopyWithImpl(DashContentResult value, Then<DashContentResult, $R> then) : super(value, then);

  @override $R call({Object? id = $none, Object? title = $none, Object? description = $none, Object? content = $none, Object? authorId = $none, Object? previewId = $none, Object? previewLink = $none}) => $then(DashContentResult(id: or(id, $value.id), title: or(title, $value.title), description: or(description, $value.description), content: or(content, $value.content), authorId: or(authorId, $value.authorId), previewId: or(previewId, $value.previewId), previewLink: or(previewLink, $value.previewLink)));
}

class DashContentModelMapper extends BaseMapper<DashContentModel> {
  DashContentModelMapper._();

  @override Function get decoder => decode;
  DashContentModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  DashContentModel fromMap(Map<String, dynamic> map) => DashContentModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'), result: Mapper.i.$getOpt(map, 'result'));

  @override Function get encoder => (DashContentModel v) => encode(v);
  dynamic encode(DashContentModel v) => toMap(v);
  Map<String, dynamic> toMap(DashContentModel d) => {'status': Mapper.i.$enc(d.status, 'status'), 'code': Mapper.i.$enc(d.code, 'code'), 'error': Mapper.i.$enc(d.error, 'error'), 'result': Mapper.i.$enc(d.result, 'result')};

  @override String stringify(DashContentModel self) => 'DashContentModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)}, result: ${Mapper.asString(self.result)})';
  @override int hash(DashContentModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error) ^ Mapper.hash(self.result);
  @override bool equals(DashContentModel self, DashContentModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error) && Mapper.isEqual(self.result, other.result);

  @override Function get typeFactory => (f) => f<DashContentModel>();
}

extension DashContentModelMapperExtension  on DashContentModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DashContentModelCopyWith<DashContentModel> get copyWith => DashContentModelCopyWith(this, $identity);
}

abstract class DashContentModelCopyWith<$R> {
  factory DashContentModelCopyWith(DashContentModel value, Then<DashContentModel, $R> then) = _DashContentModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  DashContentResultCopyWith<$R>? get result;
  $R call({bool? status, int? code, CoreError? error, DashContentResult? result});
  $R apply(DashContentModel Function(DashContentModel) transform);
}

class _DashContentModelCopyWithImpl<$R> extends BaseCopyWith<DashContentModel, $R> implements DashContentModelCopyWith<$R> {
  _DashContentModelCopyWithImpl(DashContentModel value, Then<DashContentModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override DashContentResultCopyWith<$R>? get result => $value.result != null ? DashContentResultCopyWith($value.result!, (v) => call(result: v)) : null;
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none, Object? result = $none}) => $then(DashContentModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error), result: or(result, $value.result)));
}

class DashsContentModelMapper extends BaseMapper<DashsContentModel> {
  DashsContentModelMapper._();

  @override Function get decoder => decode;
  DashsContentModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  DashsContentModel fromMap(Map<String, dynamic> map) => DashsContentModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'), result: Mapper.i.$getOpt(map, 'result') ?? const []);

  @override Function get encoder => (DashsContentModel v) => encode(v);
  dynamic encode(DashsContentModel v) => toMap(v);
  Map<String, dynamic> toMap(DashsContentModel d) => {'status': Mapper.i.$enc(d.status, 'status'), 'code': Mapper.i.$enc(d.code, 'code'), 'error': Mapper.i.$enc(d.error, 'error'), 'result': Mapper.i.$enc(d.result, 'result')};

  @override String stringify(DashsContentModel self) => 'DashsContentModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)}, result: ${Mapper.asString(self.result)})';
  @override int hash(DashsContentModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error) ^ Mapper.hash(self.result);
  @override bool equals(DashsContentModel self, DashsContentModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error) && Mapper.isEqual(self.result, other.result);

  @override Function get typeFactory => (f) => f<DashsContentModel>();
}

extension DashsContentModelMapperExtension  on DashsContentModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DashsContentModelCopyWith<DashsContentModel> get copyWith => DashsContentModelCopyWith(this, $identity);
}

abstract class DashsContentModelCopyWith<$R> {
  factory DashsContentModelCopyWith(DashsContentModel value, Then<DashsContentModel, $R> then) = _DashsContentModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  ListCopyWith<$R, DashContentResult, DashContentResultCopyWith<$R>> get result;
  $R call({bool? status, int? code, CoreError? error, List<DashContentResult>? result});
  $R apply(DashsContentModel Function(DashsContentModel) transform);
}

class _DashsContentModelCopyWithImpl<$R> extends BaseCopyWith<DashsContentModel, $R> implements DashsContentModelCopyWith<$R> {
  _DashsContentModelCopyWithImpl(DashsContentModel value, Then<DashsContentModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override ListCopyWith<$R, DashContentResult, DashContentResultCopyWith<$R>> get result => ListCopyWith($value.result, (v, t) => DashContentResultCopyWith(v, t), (v) => call(result: v));
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none, List<DashContentResult>? result}) => $then(DashsContentModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error), result: result ?? $value.result));
}

class SizeModelMapper extends BaseMapper<SizeModel> {
  SizeModelMapper._();

  @override Function get decoder => decode;
  SizeModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SizeModel fromMap(Map<String, dynamic> map) => SizeModel(size: Mapper.i.$get(map, 'size'), human: Mapper.i.$get(map, 'human'));

  @override Function get encoder => (SizeModel v) => encode(v);
  dynamic encode(SizeModel v) => toMap(v);
  Map<String, dynamic> toMap(SizeModel s) => {'size': Mapper.i.$enc(s.size, 'size'), 'human': Mapper.i.$enc(s.human, 'human')};

  @override String stringify(SizeModel self) => 'SizeModel(size: ${Mapper.asString(self.size)}, human: ${Mapper.asString(self.human)})';
  @override int hash(SizeModel self) => Mapper.hash(self.size) ^ Mapper.hash(self.human);
  @override bool equals(SizeModel self, SizeModel other) => Mapper.isEqual(self.size, other.size) && Mapper.isEqual(self.human, other.human);

  @override Function get typeFactory => (f) => f<SizeModel>();
}

extension SizeModelMapperExtension  on SizeModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SizeModelCopyWith<SizeModel> get copyWith => SizeModelCopyWith(this, $identity);
}

abstract class SizeModelCopyWith<$R> {
  factory SizeModelCopyWith(SizeModel value, Then<SizeModel, $R> then) = _SizeModelCopyWithImpl<$R>;
  $R call({int? size, String? human});
  $R apply(SizeModel Function(SizeModel) transform);
}

class _SizeModelCopyWithImpl<$R> extends BaseCopyWith<SizeModel, $R> implements SizeModelCopyWith<$R> {
  _SizeModelCopyWithImpl(SizeModel value, Then<SizeModel, $R> then) : super(value, then);

  @override $R call({int? size, String? human}) => $then(SizeModel(size: size ?? $value.size, human: human ?? $value.human));
}

class DocumentStatsMapper extends BaseMapper<DocumentStats> {
  DocumentStatsMapper._();

  @override Function get decoder => decode;
  DocumentStats decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  DocumentStats fromMap(Map<String, dynamic> map) => DocumentStats(fileName: Mapper.i.$get(map, 'file_name'), contentType: Mapper.i.$get(map, 'content_type'), lastModified: Mapper.i.$get(map, 'last_modified'), size: Mapper.i.$get(map, 'size'));

  @override Function get encoder => (DocumentStats v) => encode(v);
  dynamic encode(DocumentStats v) => toMap(v);
  Map<String, dynamic> toMap(DocumentStats d) => {'file_name': Mapper.i.$enc(d.fileName, 'fileName'), 'content_type': Mapper.i.$enc(d.contentType, 'contentType'), 'last_modified': Mapper.i.$enc(d.lastModified, 'lastModified'), 'size': Mapper.i.$enc(d.size, 'size')};

  @override String stringify(DocumentStats self) => 'DocumentStats(fileName: ${Mapper.asString(self.fileName)}, contentType: ${Mapper.asString(self.contentType)}, lastModified: ${Mapper.asString(self.lastModified)}, size: ${Mapper.asString(self.size)})';
  @override int hash(DocumentStats self) => Mapper.hash(self.fileName) ^ Mapper.hash(self.contentType) ^ Mapper.hash(self.lastModified) ^ Mapper.hash(self.size);
  @override bool equals(DocumentStats self, DocumentStats other) => Mapper.isEqual(self.fileName, other.fileName) && Mapper.isEqual(self.contentType, other.contentType) && Mapper.isEqual(self.lastModified, other.lastModified) && Mapper.isEqual(self.size, other.size);

  @override Function get typeFactory => (f) => f<DocumentStats>();
}

extension DocumentStatsMapperExtension  on DocumentStats {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DocumentStatsCopyWith<DocumentStats> get copyWith => DocumentStatsCopyWith(this, $identity);
}

abstract class DocumentStatsCopyWith<$R> {
  factory DocumentStatsCopyWith(DocumentStats value, Then<DocumentStats, $R> then) = _DocumentStatsCopyWithImpl<$R>;
  SizeModelCopyWith<$R> get size;
  $R call({String? fileName, String? contentType, DateTime? lastModified, SizeModel? size});
  $R apply(DocumentStats Function(DocumentStats) transform);
}

class _DocumentStatsCopyWithImpl<$R> extends BaseCopyWith<DocumentStats, $R> implements DocumentStatsCopyWith<$R> {
  _DocumentStatsCopyWithImpl(DocumentStats value, Then<DocumentStats, $R> then) : super(value, then);

  @override SizeModelCopyWith<$R> get size => SizeModelCopyWith($value.size, (v) => call(size: v));
  @override $R call({String? fileName, String? contentType, DateTime? lastModified, SizeModel? size}) => $then(DocumentStats(fileName: fileName ?? $value.fileName, contentType: contentType ?? $value.contentType, lastModified: lastModified ?? $value.lastModified, size: size ?? $value.size));
}

class RoleModelMapper extends BaseMapper<RoleModel> {
  RoleModelMapper._();

  @override Function get decoder => decode;
  RoleModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  RoleModel fromMap(Map<String, dynamic> map) => RoleModel(id: Mapper.i.$get(map, 'id'), title: Mapper.i.$get(map, 'title'));

  @override Function get encoder => (RoleModel v) => encode(v);
  dynamic encode(RoleModel v) => toMap(v);
  Map<String, dynamic> toMap(RoleModel r) => {'id': Mapper.i.$enc(r.id, 'id'), 'title': Mapper.i.$enc(r.title, 'title')};

  @override String stringify(RoleModel self) => 'RoleModel(id: ${Mapper.asString(self.id)}, title: ${Mapper.asString(self.title)})';
  @override int hash(RoleModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.title);
  @override bool equals(RoleModel self, RoleModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.title, other.title);

  @override Function get typeFactory => (f) => f<RoleModel>();
}

extension RoleModelMapperExtension  on RoleModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  RoleModelCopyWith<RoleModel> get copyWith => RoleModelCopyWith(this, $identity);
}

abstract class RoleModelCopyWith<$R> {
  factory RoleModelCopyWith(RoleModel value, Then<RoleModel, $R> then) = _RoleModelCopyWithImpl<$R>;
  $R call({int? id, String? title});
  $R apply(RoleModel Function(RoleModel) transform);
}

class _RoleModelCopyWithImpl<$R> extends BaseCopyWith<RoleModel, $R> implements RoleModelCopyWith<$R> {
  _RoleModelCopyWithImpl(RoleModel value, Then<RoleModel, $R> then) : super(value, then);

  @override $R call({int? id, String? title}) => $then(RoleModel(id: id ?? $value.id, title: title ?? $value.title));
}

class SignInDtoMapper extends BaseMapper<SignInDto> {
  SignInDtoMapper._();

  @override Function get decoder => decode;
  SignInDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SignInDto fromMap(Map<String, dynamic> map) => SignInDto(phone: Mapper.i.$get(map, 'phone'), password: Mapper.i.$get(map, 'password'));

  @override Function get encoder => (SignInDto v) => encode(v);
  dynamic encode(SignInDto v) => toMap(v);
  Map<String, dynamic> toMap(SignInDto s) => {'phone': Mapper.i.$enc(s.phone, 'phone'), 'password': Mapper.i.$enc(s.password, 'password')};

  @override String stringify(SignInDto self) => 'SignInDto(phone: ${Mapper.asString(self.phone)}, password: ${Mapper.asString(self.password)})';
  @override int hash(SignInDto self) => Mapper.hash(self.phone) ^ Mapper.hash(self.password);
  @override bool equals(SignInDto self, SignInDto other) => Mapper.isEqual(self.phone, other.phone) && Mapper.isEqual(self.password, other.password);

  @override Function get typeFactory => (f) => f<SignInDto>();
}

extension SignInDtoMapperExtension  on SignInDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SignInDtoCopyWith<SignInDto> get copyWith => SignInDtoCopyWith(this, $identity);
}

abstract class SignInDtoCopyWith<$R> {
  factory SignInDtoCopyWith(SignInDto value, Then<SignInDto, $R> then) = _SignInDtoCopyWithImpl<$R>;
  $R call({String? phone, String? password});
  $R apply(SignInDto Function(SignInDto) transform);
}

class _SignInDtoCopyWithImpl<$R> extends BaseCopyWith<SignInDto, $R> implements SignInDtoCopyWith<$R> {
  _SignInDtoCopyWithImpl(SignInDto value, Then<SignInDto, $R> then) : super(value, then);

  @override $R call({String? phone, String? password}) => $then(SignInDto(phone: phone ?? $value.phone, password: password ?? $value.password));
}

class SignInModelMapper extends BaseMapper<SignInModel> {
  SignInModelMapper._();

  @override Function get decoder => decode;
  SignInModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SignInModel fromMap(Map<String, dynamic> map) => SignInModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'), result: Mapper.i.$getOpt(map, 'result'));

  @override Function get encoder => (SignInModel v) => encode(v);
  dynamic encode(SignInModel v) => toMap(v);
  Map<String, dynamic> toMap(SignInModel s) => {'status': Mapper.i.$enc(s.status, 'status'), 'code': Mapper.i.$enc(s.code, 'code'), 'error': Mapper.i.$enc(s.error, 'error'), 'result': Mapper.i.$enc(s.result, 'result')};

  @override String stringify(SignInModel self) => 'SignInModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)}, result: ${Mapper.asString(self.result)})';
  @override int hash(SignInModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error) ^ Mapper.hash(self.result);
  @override bool equals(SignInModel self, SignInModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error) && Mapper.isEqual(self.result, other.result);

  @override Function get typeFactory => (f) => f<SignInModel>();
}

extension SignInModelMapperExtension  on SignInModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SignInModelCopyWith<SignInModel> get copyWith => SignInModelCopyWith(this, $identity);
}

abstract class SignInModelCopyWith<$R> {
  factory SignInModelCopyWith(SignInModel value, Then<SignInModel, $R> then) = _SignInModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  SignInResultCopyWith<$R>? get result;
  $R call({bool? status, int? code, CoreError? error, SignInResult? result});
  $R apply(SignInModel Function(SignInModel) transform);
}

class _SignInModelCopyWithImpl<$R> extends BaseCopyWith<SignInModel, $R> implements SignInModelCopyWith<$R> {
  _SignInModelCopyWithImpl(SignInModel value, Then<SignInModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override SignInResultCopyWith<$R>? get result => $value.result != null ? SignInResultCopyWith($value.result!, (v) => call(result: v)) : null;
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none, Object? result = $none}) => $then(SignInModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error), result: or(result, $value.result)));
}

class SignInResultMapper extends BaseMapper<SignInResult> {
  SignInResultMapper._();

  @override Function get decoder => decode;
  SignInResult decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SignInResult fromMap(Map<String, dynamic> map) => SignInResult(session: Mapper.i.$getOpt(map, 'session'));

  @override Function get encoder => (SignInResult v) => encode(v);
  dynamic encode(SignInResult v) => toMap(v);
  Map<String, dynamic> toMap(SignInResult s) => {'session': Mapper.i.$enc(s.session, 'session')};

  @override String stringify(SignInResult self) => 'SignInResult(session: ${Mapper.asString(self.session)})';
  @override int hash(SignInResult self) => Mapper.hash(self.session);
  @override bool equals(SignInResult self, SignInResult other) => Mapper.isEqual(self.session, other.session);

  @override Function get typeFactory => (f) => f<SignInResult>();
}

extension SignInResultMapperExtension  on SignInResult {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SignInResultCopyWith<SignInResult> get copyWith => SignInResultCopyWith(this, $identity);
}

abstract class SignInResultCopyWith<$R> {
  factory SignInResultCopyWith(SignInResult value, Then<SignInResult, $R> then) = _SignInResultCopyWithImpl<$R>;
  $R call({String? session});
  $R apply(SignInResult Function(SignInResult) transform);
}

class _SignInResultCopyWithImpl<$R> extends BaseCopyWith<SignInResult, $R> implements SignInResultCopyWith<$R> {
  _SignInResultCopyWithImpl(SignInResult value, Then<SignInResult, $R> then) : super(value, then);

  @override $R call({Object? session = $none}) => $then(SignInResult(session: or(session, $value.session)));
}

class SignUpDtoMapper extends BaseMapper<SignUpDto> {
  SignUpDtoMapper._();

  @override Function get decoder => decode;
  SignUpDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SignUpDto fromMap(Map<String, dynamic> map) => SignUpDto(login: Mapper.i.$get(map, 'login'), phone: Mapper.i.$get(map, 'phone'), firstName: Mapper.i.$get(map, 'first_name'), lastName: Mapper.i.$get(map, 'last_name'), password: Mapper.i.$get(map, 'password'));

  @override Function get encoder => (SignUpDto v) => encode(v);
  dynamic encode(SignUpDto v) => toMap(v);
  Map<String, dynamic> toMap(SignUpDto s) => {'login': Mapper.i.$enc(s.login, 'login'), 'phone': Mapper.i.$enc(s.phone, 'phone'), 'first_name': Mapper.i.$enc(s.firstName, 'firstName'), 'last_name': Mapper.i.$enc(s.lastName, 'lastName'), 'password': Mapper.i.$enc(s.password, 'password')};

  @override String stringify(SignUpDto self) => 'SignUpDto(login: ${Mapper.asString(self.login)}, phone: ${Mapper.asString(self.phone)}, firstName: ${Mapper.asString(self.firstName)}, lastName: ${Mapper.asString(self.lastName)}, password: ${Mapper.asString(self.password)})';
  @override int hash(SignUpDto self) => Mapper.hash(self.login) ^ Mapper.hash(self.phone) ^ Mapper.hash(self.firstName) ^ Mapper.hash(self.lastName) ^ Mapper.hash(self.password);
  @override bool equals(SignUpDto self, SignUpDto other) => Mapper.isEqual(self.login, other.login) && Mapper.isEqual(self.phone, other.phone) && Mapper.isEqual(self.firstName, other.firstName) && Mapper.isEqual(self.lastName, other.lastName) && Mapper.isEqual(self.password, other.password);

  @override Function get typeFactory => (f) => f<SignUpDto>();
}

extension SignUpDtoMapperExtension  on SignUpDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SignUpDtoCopyWith<SignUpDto> get copyWith => SignUpDtoCopyWith(this, $identity);
}

abstract class SignUpDtoCopyWith<$R> {
  factory SignUpDtoCopyWith(SignUpDto value, Then<SignUpDto, $R> then) = _SignUpDtoCopyWithImpl<$R>;
  $R call({String? login, String? phone, String? firstName, String? lastName, String? password});
  $R apply(SignUpDto Function(SignUpDto) transform);
}

class _SignUpDtoCopyWithImpl<$R> extends BaseCopyWith<SignUpDto, $R> implements SignUpDtoCopyWith<$R> {
  _SignUpDtoCopyWithImpl(SignUpDto value, Then<SignUpDto, $R> then) : super(value, then);

  @override $R call({String? login, String? phone, String? firstName, String? lastName, String? password}) => $then(SignUpDto(login: login ?? $value.login, phone: phone ?? $value.phone, firstName: firstName ?? $value.firstName, lastName: lastName ?? $value.lastName, password: password ?? $value.password));
}

class SignUpModelMapper extends BaseMapper<SignUpModel> {
  SignUpModelMapper._();

  @override Function get decoder => decode;
  SignUpModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SignUpModel fromMap(Map<String, dynamic> map) => SignUpModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'), result: Mapper.i.$getOpt(map, 'result'));

  @override Function get encoder => (SignUpModel v) => encode(v);
  dynamic encode(SignUpModel v) => toMap(v);
  Map<String, dynamic> toMap(SignUpModel s) => {'status': Mapper.i.$enc(s.status, 'status'), 'code': Mapper.i.$enc(s.code, 'code'), 'error': Mapper.i.$enc(s.error, 'error'), 'result': Mapper.i.$enc(s.result, 'result')};

  @override String stringify(SignUpModel self) => 'SignUpModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)}, result: ${Mapper.asString(self.result)})';
  @override int hash(SignUpModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error) ^ Mapper.hash(self.result);
  @override bool equals(SignUpModel self, SignUpModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error) && Mapper.isEqual(self.result, other.result);

  @override Function get typeFactory => (f) => f<SignUpModel>();
}

extension SignUpModelMapperExtension  on SignUpModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SignUpModelCopyWith<SignUpModel> get copyWith => SignUpModelCopyWith(this, $identity);
}

abstract class SignUpModelCopyWith<$R> {
  factory SignUpModelCopyWith(SignUpModel value, Then<SignUpModel, $R> then) = _SignUpModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  UserResultCopyWith<$R>? get result;
  $R call({bool? status, int? code, CoreError? error, UserResult? result});
  $R apply(SignUpModel Function(SignUpModel) transform);
}

class _SignUpModelCopyWithImpl<$R> extends BaseCopyWith<SignUpModel, $R> implements SignUpModelCopyWith<$R> {
  _SignUpModelCopyWithImpl(SignUpModel value, Then<SignUpModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override UserResultCopyWith<$R>? get result => $value.result != null ? UserResultCopyWith($value.result!, (v) => call(result: v)) : null;
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none, Object? result = $none}) => $then(SignUpModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error), result: or(result, $value.result)));
}

class VerifyDtoMapper extends BaseMapper<VerifyDto> {
  VerifyDtoMapper._();

  @override Function get decoder => decode;
  VerifyDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  VerifyDto fromMap(Map<String, dynamic> map) => VerifyDto(sessionId: Mapper.i.$get(map, 'session_id'), code: Mapper.i.$get(map, 'code'));

  @override Function get encoder => (VerifyDto v) => encode(v);
  dynamic encode(VerifyDto v) => toMap(v);
  Map<String, dynamic> toMap(VerifyDto v) => {'session_id': Mapper.i.$enc(v.sessionId, 'sessionId'), 'code': Mapper.i.$enc(v.code, 'code')};

  @override String stringify(VerifyDto self) => 'VerifyDto(sessionId: ${Mapper.asString(self.sessionId)}, code: ${Mapper.asString(self.code)})';
  @override int hash(VerifyDto self) => Mapper.hash(self.sessionId) ^ Mapper.hash(self.code);
  @override bool equals(VerifyDto self, VerifyDto other) => Mapper.isEqual(self.sessionId, other.sessionId) && Mapper.isEqual(self.code, other.code);

  @override Function get typeFactory => (f) => f<VerifyDto>();
}

extension VerifyDtoMapperExtension  on VerifyDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  VerifyDtoCopyWith<VerifyDto> get copyWith => VerifyDtoCopyWith(this, $identity);
}

abstract class VerifyDtoCopyWith<$R> {
  factory VerifyDtoCopyWith(VerifyDto value, Then<VerifyDto, $R> then) = _VerifyDtoCopyWithImpl<$R>;
  $R call({String? sessionId, String? code});
  $R apply(VerifyDto Function(VerifyDto) transform);
}

class _VerifyDtoCopyWithImpl<$R> extends BaseCopyWith<VerifyDto, $R> implements VerifyDtoCopyWith<$R> {
  _VerifyDtoCopyWithImpl(VerifyDto value, Then<VerifyDto, $R> then) : super(value, then);

  @override $R call({String? sessionId, String? code}) => $then(VerifyDto(sessionId: sessionId ?? $value.sessionId, code: code ?? $value.code));
}

class VerifyModelMapper extends BaseMapper<VerifyModel> {
  VerifyModelMapper._();

  @override Function get decoder => decode;
  VerifyModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  VerifyModel fromMap(Map<String, dynamic> map) => VerifyModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'), accessToken: Mapper.i.$getOpt(map, 'access_token'), tokenType: Mapper.i.$getOpt(map, 'token_type'), userUuid: Mapper.i.$getOpt(map, 'user_uuid'));

  @override Function get encoder => (VerifyModel v) => encode(v);
  dynamic encode(VerifyModel v) => toMap(v);
  Map<String, dynamic> toMap(VerifyModel v) => {'status': Mapper.i.$enc(v.status, 'status'), 'code': Mapper.i.$enc(v.code, 'code'), 'error': Mapper.i.$enc(v.error, 'error'), 'access_token': Mapper.i.$enc(v.accessToken, 'accessToken'), 'token_type': Mapper.i.$enc(v.tokenType, 'tokenType'), 'user_uuid': Mapper.i.$enc(v.userUuid, 'userUuid')};

  @override String stringify(VerifyModel self) => 'VerifyModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)}, accessToken: ${Mapper.asString(self.accessToken)}, tokenType: ${Mapper.asString(self.tokenType)}, userUuid: ${Mapper.asString(self.userUuid)})';
  @override int hash(VerifyModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error) ^ Mapper.hash(self.accessToken) ^ Mapper.hash(self.tokenType) ^ Mapper.hash(self.userUuid);
  @override bool equals(VerifyModel self, VerifyModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error) && Mapper.isEqual(self.accessToken, other.accessToken) && Mapper.isEqual(self.tokenType, other.tokenType) && Mapper.isEqual(self.userUuid, other.userUuid);

  @override Function get typeFactory => (f) => f<VerifyModel>();
}

extension VerifyModelMapperExtension  on VerifyModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  VerifyModelCopyWith<VerifyModel> get copyWith => VerifyModelCopyWith(this, $identity);
}

abstract class VerifyModelCopyWith<$R> {
  factory VerifyModelCopyWith(VerifyModel value, Then<VerifyModel, $R> then) = _VerifyModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  $R call({bool? status, int? code, CoreError? error, String? accessToken, String? tokenType, String? userUuid});
  $R apply(VerifyModel Function(VerifyModel) transform);
}

class _VerifyModelCopyWithImpl<$R> extends BaseCopyWith<VerifyModel, $R> implements VerifyModelCopyWith<$R> {
  _VerifyModelCopyWithImpl(VerifyModel value, Then<VerifyModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none, Object? accessToken = $none, Object? tokenType = $none, Object? userUuid = $none}) => $then(VerifyModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error), accessToken: or(accessToken, $value.accessToken), tokenType: or(tokenType, $value.tokenType), userUuid: or(userUuid, $value.userUuid)));
}

class DeviceModelMapper extends BaseMapper<DeviceModel> {
  DeviceModelMapper._();

  @override Function get decoder => decode;
  DeviceModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  DeviceModel fromMap(Map<String, dynamic> map) => DeviceModel(uuid: Mapper.i.$getOpt(map, 'uuid'), deviceFamily: Mapper.i.$getOpt(map, 'device_family'), osVersion: Mapper.i.$getOpt(map, 'os_version'), browserVersion: Mapper.i.$getOpt(map, 'browser_version'), country: Mapper.i.$getOpt(map, 'country'), deviceType: Mapper.i.$getOpt(map, 'device_type'), osFamily: Mapper.i.$getOpt(map, 'os_family'), deviceBrand: Mapper.i.$getOpt(map, 'device_brand'), browserFamily: Mapper.i.$getOpt(map, 'browser_family'), ip: Mapper.i.$getOpt(map, 'ip'), city: Mapper.i.$getOpt(map, 'city'));

  @override Function get encoder => (DeviceModel v) => encode(v);
  dynamic encode(DeviceModel v) => toMap(v);
  Map<String, dynamic> toMap(DeviceModel d) => {'uuid': Mapper.i.$enc(d.uuid, 'uuid'), 'device_family': Mapper.i.$enc(d.deviceFamily, 'deviceFamily'), 'os_version': Mapper.i.$enc(d.osVersion, 'osVersion'), 'browser_version': Mapper.i.$enc(d.browserVersion, 'browserVersion'), 'country': Mapper.i.$enc(d.country, 'country'), 'device_type': Mapper.i.$enc(d.deviceType, 'deviceType'), 'os_family': Mapper.i.$enc(d.osFamily, 'osFamily'), 'device_brand': Mapper.i.$enc(d.deviceBrand, 'deviceBrand'), 'browser_family': Mapper.i.$enc(d.browserFamily, 'browserFamily'), 'ip': Mapper.i.$enc(d.ip, 'ip'), 'city': Mapper.i.$enc(d.city, 'city')};

  @override String stringify(DeviceModel self) => 'DeviceModel(uuid: ${Mapper.asString(self.uuid)}, deviceFamily: ${Mapper.asString(self.deviceFamily)}, osVersion: ${Mapper.asString(self.osVersion)}, browserVersion: ${Mapper.asString(self.browserVersion)}, country: ${Mapper.asString(self.country)}, deviceType: ${Mapper.asString(self.deviceType)}, osFamily: ${Mapper.asString(self.osFamily)}, deviceBrand: ${Mapper.asString(self.deviceBrand)}, browserFamily: ${Mapper.asString(self.browserFamily)}, ip: ${Mapper.asString(self.ip)}, city: ${Mapper.asString(self.city)})';
  @override int hash(DeviceModel self) => Mapper.hash(self.uuid) ^ Mapper.hash(self.deviceFamily) ^ Mapper.hash(self.osVersion) ^ Mapper.hash(self.browserVersion) ^ Mapper.hash(self.country) ^ Mapper.hash(self.deviceType) ^ Mapper.hash(self.osFamily) ^ Mapper.hash(self.deviceBrand) ^ Mapper.hash(self.browserFamily) ^ Mapper.hash(self.ip) ^ Mapper.hash(self.city);
  @override bool equals(DeviceModel self, DeviceModel other) => Mapper.isEqual(self.uuid, other.uuid) && Mapper.isEqual(self.deviceFamily, other.deviceFamily) && Mapper.isEqual(self.osVersion, other.osVersion) && Mapper.isEqual(self.browserVersion, other.browserVersion) && Mapper.isEqual(self.country, other.country) && Mapper.isEqual(self.deviceType, other.deviceType) && Mapper.isEqual(self.osFamily, other.osFamily) && Mapper.isEqual(self.deviceBrand, other.deviceBrand) && Mapper.isEqual(self.browserFamily, other.browserFamily) && Mapper.isEqual(self.ip, other.ip) && Mapper.isEqual(self.city, other.city);

  @override Function get typeFactory => (f) => f<DeviceModel>();
}

extension DeviceModelMapperExtension  on DeviceModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DeviceModelCopyWith<DeviceModel> get copyWith => DeviceModelCopyWith(this, $identity);
}

abstract class DeviceModelCopyWith<$R> {
  factory DeviceModelCopyWith(DeviceModel value, Then<DeviceModel, $R> then) = _DeviceModelCopyWithImpl<$R>;
  $R call({String? uuid, String? deviceFamily, String? osVersion, String? browserVersion, String? country, String? deviceType, String? osFamily, String? deviceBrand, String? browserFamily, String? ip, String? city});
  $R apply(DeviceModel Function(DeviceModel) transform);
}

class _DeviceModelCopyWithImpl<$R> extends BaseCopyWith<DeviceModel, $R> implements DeviceModelCopyWith<$R> {
  _DeviceModelCopyWithImpl(DeviceModel value, Then<DeviceModel, $R> then) : super(value, then);

  @override $R call({Object? uuid = $none, Object? deviceFamily = $none, Object? osVersion = $none, Object? browserVersion = $none, Object? country = $none, Object? deviceType = $none, Object? osFamily = $none, Object? deviceBrand = $none, Object? browserFamily = $none, Object? ip = $none, Object? city = $none}) => $then(DeviceModel(uuid: or(uuid, $value.uuid), deviceFamily: or(deviceFamily, $value.deviceFamily), osVersion: or(osVersion, $value.osVersion), browserVersion: or(browserVersion, $value.browserVersion), country: or(country, $value.country), deviceType: or(deviceType, $value.deviceType), osFamily: or(osFamily, $value.osFamily), deviceBrand: or(deviceBrand, $value.deviceBrand), browserFamily: or(browserFamily, $value.browserFamily), ip: or(ip, $value.ip), city: or(city, $value.city)));
}

class SessionModelMapper extends BaseMapper<SessionModel> {
  SessionModelMapper._();

  @override Function get decoder => decode;
  SessionModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SessionModel fromMap(Map<String, dynamic> map) => SessionModel(status: Mapper.i.$getOpt(map, 'status'), code: Mapper.i.$getOpt(map, 'code'), error: Mapper.i.$getOpt(map, 'error'), result: Mapper.i.$getOpt(map, 'result') ?? const []);

  @override Function get encoder => (SessionModel v) => encode(v);
  dynamic encode(SessionModel v) => toMap(v);
  Map<String, dynamic> toMap(SessionModel s) => {'status': Mapper.i.$enc(s.status, 'status'), 'code': Mapper.i.$enc(s.code, 'code'), 'error': Mapper.i.$enc(s.error, 'error'), 'result': Mapper.i.$enc(s.result, 'result')};

  @override String stringify(SessionModel self) => 'SessionModel(status: ${Mapper.asString(self.status)}, code: ${Mapper.asString(self.code)}, error: ${Mapper.asString(self.error)}, result: ${Mapper.asString(self.result)})';
  @override int hash(SessionModel self) => Mapper.hash(self.status) ^ Mapper.hash(self.code) ^ Mapper.hash(self.error) ^ Mapper.hash(self.result);
  @override bool equals(SessionModel self, SessionModel other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.error, other.error) && Mapper.isEqual(self.result, other.result);

  @override Function get typeFactory => (f) => f<SessionModel>();
}

extension SessionModelMapperExtension  on SessionModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SessionModelCopyWith<SessionModel> get copyWith => SessionModelCopyWith(this, $identity);
}

abstract class SessionModelCopyWith<$R> {
  factory SessionModelCopyWith(SessionModel value, Then<SessionModel, $R> then) = _SessionModelCopyWithImpl<$R>;
  CoreErrorCopyWith<$R>? get error;
  ListCopyWith<$R, SessionResult, SessionResultCopyWith<$R>> get result;
  $R call({bool? status, int? code, CoreError? error, List<SessionResult>? result});
  $R apply(SessionModel Function(SessionModel) transform);
}

class _SessionModelCopyWithImpl<$R> extends BaseCopyWith<SessionModel, $R> implements SessionModelCopyWith<$R> {
  _SessionModelCopyWithImpl(SessionModel value, Then<SessionModel, $R> then) : super(value, then);

  @override CoreErrorCopyWith<$R>? get error => $value.error != null ? CoreErrorCopyWith($value.error!, (v) => call(error: v)) : null;
  @override ListCopyWith<$R, SessionResult, SessionResultCopyWith<$R>> get result => ListCopyWith($value.result, (v, t) => SessionResultCopyWith(v, t), (v) => call(result: v));
  @override $R call({Object? status = $none, Object? code = $none, Object? error = $none, List<SessionResult>? result}) => $then(SessionModel(status: or(status, $value.status), code: or(code, $value.code), error: or(error, $value.error), result: result ?? $value.result));
}

class SessionResultMapper extends BaseMapper<SessionResult> {
  SessionResultMapper._();

  @override Function get decoder => decode;
  SessionResult decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SessionResult fromMap(Map<String, dynamic> map) => SessionResult(status: Mapper.i.$getOpt(map, 'status'), uuid: Mapper.i.$getOpt(map, 'uuid'), device: Mapper.i.$getOpt(map, 'device'));

  @override Function get encoder => (SessionResult v) => encode(v);
  dynamic encode(SessionResult v) => toMap(v);
  Map<String, dynamic> toMap(SessionResult s) => {'status': Mapper.i.$enc(s.status, 'status'), 'uuid': Mapper.i.$enc(s.uuid, 'uuid'), 'device': Mapper.i.$enc(s.device, 'device')};

  @override String stringify(SessionResult self) => 'SessionResult(status: ${Mapper.asString(self.status)}, uuid: ${Mapper.asString(self.uuid)}, device: ${Mapper.asString(self.device)})';
  @override int hash(SessionResult self) => Mapper.hash(self.status) ^ Mapper.hash(self.uuid) ^ Mapper.hash(self.device);
  @override bool equals(SessionResult self, SessionResult other) => Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.uuid, other.uuid) && Mapper.isEqual(self.device, other.device);

  @override Function get typeFactory => (f) => f<SessionResult>();
}

extension SessionResultMapperExtension  on SessionResult {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SessionResultCopyWith<SessionResult> get copyWith => SessionResultCopyWith(this, $identity);
}

abstract class SessionResultCopyWith<$R> {
  factory SessionResultCopyWith(SessionResult value, Then<SessionResult, $R> then) = _SessionResultCopyWithImpl<$R>;
  CoreStatusCopyWith<$R>? get status;
  DeviceModelCopyWith<$R>? get device;
  $R call({CoreStatus? status, String? uuid, DeviceModel? device});
  $R apply(SessionResult Function(SessionResult) transform);
}

class _SessionResultCopyWithImpl<$R> extends BaseCopyWith<SessionResult, $R> implements SessionResultCopyWith<$R> {
  _SessionResultCopyWithImpl(SessionResult value, Then<SessionResult, $R> then) : super(value, then);

  @override CoreStatusCopyWith<$R>? get status => $value.status != null ? CoreStatusCopyWith($value.status!, (v) => call(status: v)) : null;
  @override DeviceModelCopyWith<$R>? get device => $value.device != null ? DeviceModelCopyWith($value.device!, (v) => call(device: v)) : null;
  @override $R call({Object? status = $none, Object? uuid = $none, Object? device = $none}) => $then(SessionResult(status: or(status, $value.status), uuid: or(uuid, $value.uuid), device: or(device, $value.device)));
}

class CoreStatusMapper extends BaseMapper<CoreStatus> {
  CoreStatusMapper._();

  @override Function get decoder => decode;
  CoreStatus decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  CoreStatus fromMap(Map<String, dynamic> map) => CoreStatus(id: Mapper.i.$getOpt(map, 'id'), title: Mapper.i.$getOpt(map, 'title'));

  @override Function get encoder => (CoreStatus v) => encode(v);
  dynamic encode(CoreStatus v) => toMap(v);
  Map<String, dynamic> toMap(CoreStatus c) => {'id': Mapper.i.$enc(c.id, 'id'), 'title': Mapper.i.$enc(c.title, 'title')};

  @override String stringify(CoreStatus self) => 'CoreStatus(id: ${Mapper.asString(self.id)}, title: ${Mapper.asString(self.title)})';
  @override int hash(CoreStatus self) => Mapper.hash(self.id) ^ Mapper.hash(self.title);
  @override bool equals(CoreStatus self, CoreStatus other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.title, other.title);

  @override Function get typeFactory => (f) => f<CoreStatus>();
}

extension CoreStatusMapperExtension  on CoreStatus {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CoreStatusCopyWith<CoreStatus> get copyWith => CoreStatusCopyWith(this, $identity);
}

abstract class CoreStatusCopyWith<$R> {
  factory CoreStatusCopyWith(CoreStatus value, Then<CoreStatus, $R> then) = _CoreStatusCopyWithImpl<$R>;
  $R call({int? id, String? title});
  $R apply(CoreStatus Function(CoreStatus) transform);
}

class _CoreStatusCopyWithImpl<$R> extends BaseCopyWith<CoreStatus, $R> implements CoreStatusCopyWith<$R> {
  _CoreStatusCopyWithImpl(CoreStatus value, Then<CoreStatus, $R> then) : super(value, then);

  @override $R call({Object? id = $none, Object? title = $none}) => $then(CoreStatus(id: or(id, $value.id), title: or(title, $value.title)));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue(dynamic value) => i.toValue(value);
  static Map<String, dynamic> toMap(dynamic object) => i.toMap(object);
  static Iterable<dynamic> toIterable(dynamic object) => i.toIterable(object);
  static String toJson(dynamic object) => i.toJson(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(BaseMapper<T> mapper) => i.use<T>(mapper);
  static BaseMapper<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<BaseMapper> mappers) => i.useAll(mappers);

  static BaseMapper<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<BaseMapper> getAll() => i.getAll();
}

mixin Mappable implements MappableMixin {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override
  String toString() {
    return _guard(() => Mapper.asString(this), super.toString);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            _guard(() => Mapper.isEqual(this, other), () => super == other));
  }

  @override
  int get hashCode {
    return _guard(() => Mapper.hash(this), () => super.hashCode);
  }

  T _guard<T>(T Function() fn, T Function() fallback) {
    try {
      return fn();
    } on MapperException catch (e) {
      if (e.isUnsupportedOrUnallowed()) {
        return fallback();
      } else {
        rethrow;
      }
    }
  }
}
