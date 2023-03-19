import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:template/data/data_sources/chats/remote_chats_ds.dart';
import 'package:template/data/data_sources/dashboard/remote_dashboard_ds.dart';
import 'package:template/data/data_sources/documents/remote_documents_ds.dart';
import 'package:template/data/data_sources/messages/remote_messages_ds.dart';
import 'package:template/data/data_sources/user/remote_user_ds.dart';
import 'package:template/domain/di/core/app_dependency.dart';
import 'package:template/domain/di/global_dependency.dart';
import 'package:template/domain/di/preload.dart';
import 'package:template/domain/services/chat_socket_service.dart';
import 'package:template/domain/services/chats_service.dart';
import 'package:template/domain/services/dashboard_service.dart';
import 'package:template/domain/services/documents_service.dart';
import 'package:template/domain/services/messages_service.dart';
import 'package:template/domain/services/user_service.dart';

class UserDependency extends AppDependency {
  UserDependency(super.context);
  late final ChatsService _chatsService;
  late final MessageService _messageService;
  late final ChatSocketService _chatSocketsService;
  late final UserService _userService;
  late final DashboardService _dashboardService;
  late final DocumentsService _documentsService;

  MessageService get messageService => _messageService;
  ChatsService get chatsService => _chatsService;
  ChatSocketService get chatSocketService => _chatSocketsService;
  UserService get userService => _userService;
  DashboardService get dashboardService => _dashboardService;
  DocumentsService get documentsService => _documentsService;

  @override
  Future<void> init(BuildContext context) async {
    final globalDependency = context.read<GlobalDependency>();
    final preloadDepenpency = context.read<PreloadDependency>();
    final chatRds = RemoteChatsDataSource.create(preloadDepenpency.coreClient);
    final mesRds = RemoteMessagesDataSource.create(preloadDepenpency.coreClient);
    final userRds = RemoteUserDataSource.create(preloadDepenpency.authClient);
    final dashRds = RemoteDashboardDataSource.create(preloadDepenpency.dashClient);
    final docRds = RemoteDocumentsDataSource.create(preloadDepenpency.docClient);

    _messageService = MessageService(globalDependency.dialogService, mesRds);
    _chatsService = ChatsService(globalDependency.dialogService, chatRds);
    _chatSocketsService = ChatSocketService(
      globalDependency.dialogService,
      globalDependency.authService,
    );
    _userService = UserService(globalDependency.dialogService, userRds);
    _dashboardService = DashboardService(globalDependency.dialogService, dashRds);
    _documentsService = DocumentsService(globalDependency.dialogService, docRds);

    await _messageService.init();
    await _chatsService.init();
    await _chatSocketsService.init();
    await _userService.init();
    await _dashboardService.init();
    await _documentsService.init();
  }

  @override
  void dispose() {
    _messageService.dispose();
    _chatsService.dispose();
  }
}

extension UserReader on BuildContext {
  UserDependency get user => read<UserDependency>();
}
