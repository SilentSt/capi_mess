import 'dart:developer';

import 'package:just_audio/just_audio.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:template/domain/services/auth_service.dart';
import 'package:template/domain/services/core/app_service.dart';

class ChatSocketService extends AppService {
  ChatSocketService(super.dialogService, this.authService);
  final AuthService authService;
  late final Socket _socket;

  AudioPlayer audio = AudioPlayer();

  Socket get socket => _socket;

  @override
  Future<void> init() async {
    await audio.setUrl(
      'https://document.capi.shitposting.team/v1/documents/dd49e9ea-b1c6-4604-ae9e-591f752d7259/file',
      preload: true,
    );
    _socket = io(
      'https://socket.capi.shitposting.team/v1',
      OptionBuilder()
          .setQuery({'jwt': 'Bearer ${authService.token}'})
          .enableForceNew()
          .enableReconnection()
          .enableForceNew()
          .setReconnectionAttempts(3)
          .setPath('/socket.io')
          .enableForceNewConnection()
          .setTransports(['websocket'])
          .build(),
    );
    _socket.onAny((event, data) async {
      log(event);
      final val = data.toString();
      log(val);
      if (authService.meModel == null) {
        await authService.me();
      }
      
      if (event == 'newMessageResponse' && data['author_id'] != authService.meModel?.uuid) {
        await audio.play();
        await audio.seek(const Duration());
        //if (App.router.current.path.contains('chats')) return;
        // dialogService.showMessageAlert(
        //   MaterialBanner(
        //     backgroundColor: ColorName.appBlue,
        //     content: Text(
        //       'Новое сообщение',
        //       style: AppTypography.sf.s16.w500.white,
        //     ),
        //     actions: [
        //       AppButton(
        //         onTap: () {
        //           ScaffoldMessenger.of(dialogService.context).hideCurrentMaterialBanner();
        //           App.router.navigate(
        //             ChatsViewRoute(
        //               chatId: data['conversation_id'],
        //             ),
        //           );
        //         },
        //         text: 'Открыть',
        //       ),
        //       AppButton(
        //         onTap: () => ScaffoldMessenger.of(dialogService.context).hideCurrentMaterialBanner(),
        //         text: 'Скрыть',
        //       ),
        //     ],
        //   ),
        // );
      }
    });
    _socket.on('connected', (data) {
      log(data.toString());
      log('connected');
    });
    return super.init();
  }

  @override
  void dispose() {
    _socket.disconnect();
    _socket.dispose();
    super.dispose();
  }
}
