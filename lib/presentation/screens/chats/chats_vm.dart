import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/data/models/models.dart';
import 'package:template/domain/services/auth_service.dart';
import 'package:template/domain/services/chat_socket_service.dart';
import 'package:template/domain/services/chats_service.dart';
import 'package:template/domain/services/documents_service.dart';
import 'package:template/domain/services/messages_service.dart';
import 'package:template/domain/services/upload_service.dart';

class ChatsViewModel extends BaseViewModel {
  ChatsViewModel({
    required this.chatsService,
    required this.chatSocketService,
    required this.messageService,
    required this.authService,
    required this.chatId,
    required this.uploadService,
    required this.documentsService,
  });

  final ChatsService chatsService;
  final ChatSocketService chatSocketService;
  final MessageService messageService;
  final AuthService authService;
  final UploadService uploadService;
  final DocumentsService documentsService;

  final messageController = TextEditingController();
  final replyController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController? scrollController;
  final String? chatId;
  ChatResult? selectedChat;
  String? threadId;
  MeResult? me;
  List<String>? files;

  List<MessageResult> messages = [];
  List<MessageResult> threadMessages = [];
  List<ChatResult> publicChats = [];
  List<ChatResult> privateChats = [];
  List<String> uploadingFiles = [];

  Future<void> onViewModelReay() async {
    await fetchChats();
    await fetchMe();
    //audio.setUrl('https://github.com/mattermost/mattermost-webapp/blob/master/sounds/bing.mp3');

    chatSocketService.socket.onAny(_socketListener);
  }

  Future<void> fetchChats() async {
    final chats = await chatsService.fetch();
    for (final chat in chats) {
      if (chat.typeId == 1) {
        privateChats.add(chat);
      } else {
        publicChats.add(chat);
      }
    }
    notifyListeners();
    if (chatId == null) {
      if (publicChats.isNotEmpty) {
        selectChat(publicChats.first);
      } else if (privateChats.isNotEmpty) {
        selectChat(privateChats.first);
      }
    } else {
      if (chats.map((e) => e.uuid).contains(chatId)) {
        selectedChat = chats.firstWhere((element) => element.uuid == chatId);
        notifyListeners();
      }
    }
  }

  Future<void> selectChat(ChatResult value) async {
    selectedChat = value;
    notifyListeners();
    scrollController = ScrollController();
    scrollController!.addListener(() async {
      if (scrollController!.position.atEdge) {
        if (scrollController!.position.pixels == 0) {
          await fetchMessages();
        }
      }
    });
    await fetchMessages(clear: true, first: true);
    notifyListeners();
  }

  Future<void> createPrivateChat(String? uuid) async {
    if (uuid == null) return;
    final res = await chatsService.create(
      ChatDto(
        type: 'PRIVATE',
        companion: CompanionModel(
          uuid: uuid,
        ),
      ),
    );
    if (res == null) return;
    if (privateChats.where((element) => element.uuid == res.uuid).isEmpty) {
      privateChats.add(res);
    }

    notifyListeners();
    selectChat(res);
  }

  Future<void> createPublicChat(String title) async {
    final res = await chatsService.create(
      ChatDto(
        type: 'PUBLIC',
        chat: ChatCreator(
          title: title,
        ),
      ),
    );
    if (res == null) return;
    if (publicChats.where((element) => element.uuid == res.uuid).isEmpty) {
      publicChats.add(res);
    }

    notifyListeners();
    selectChat(res);
  }

  Future<void> fetchMessages({bool clear = false, bool first = false}) async {
    if (clear) {
      messages.clear();
    }
    int messagesCount = messages.length;
    final res = await messageService.fetch(
      selectedChat!.uuid!,
      offset: messages.length,
    );
    for (final model in res) {
      if (model.documents.isNotEmpty) {
        for (final doc in model.documents) {
          final result = await documentsService.getById(doc.documentId);
          if (result == null) continue;
          model.documentStats.add(result);
        }
      }
    }
    messages = [...res.reversed.toList(), ...messages];
    notifyListeners();
    if (first) {
      scrollController!.jumpTo(0);
      return;
    }
    if (messagesCount == messages.length) return;
    scrollController!.jumpTo(100);
  }

  Future<void> fetchMe() async {
    me = await authService.me();
    notifyListeners();
  }

  Future<void> sendMessage(String? replyId) async {
    if (selectedChat?.uuid == null) return;
    String text = '';
    if (replyId != null) {
      text = replyController.text.trim();
      replyController.clear();
    } else {
      text = messageController.text.trim();
      messageController.clear();
    }
    if (text.isEmpty) {
      return;
    }
    List<String> sendedFiles = [];
    sendedFiles.addAll(uploadingFiles);
    files = null;
    uploadingFiles.clear();
    notifyListeners();
    await messageService.send(
      chatId: selectedChat!.uuid!,
      dto: SendMessageDto(
        text: text,
        replyUuid: replyId,
        documents: sendedFiles,
      ),
    );
  }

  Future<void> openThread(String? id) async {
    if (id == null || selectedChat?.uuid == null) return;
    threadId = id;
    threadMessages = (await messageService.fetchThread(
      chatId: selectedChat!.uuid!,
      messageId: id,
    ))
        .reversed
        .toList();
    notifyListeners();
  }

  Future<void> deleteMessage(int index, String? id) async {
    if (id == null) return;
    //final res =
    if (selectedChat?.uuid == null) return;
    await messageService.delete(
      chatId: selectedChat!.uuid!,
      messageId: id,
    );
    // if (res == null) return;
    // messages.removeAt(index);
    // notifyListeners();
  }

  Future<void> updateMessage(int index, String id, String text) async {
    //final res =
    if (selectedChat?.uuid == null) return;
    await messageService.patchMessage(
      chatId: selectedChat!.uuid!,
      messageId: id,
      dto: PatchMessageDto(text: text),
    );
    // if (res == null) return;
    // messages[index] = res;
    // notifyListeners();
  }

  Future<void> uploadFiles() async {
    final res = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (res == null) return;
    files = res.files.map((e) => e.name).toList();
    notifyListeners();
    for (var element in res.files) {
      final res = await uploadService.uploadFiles(element);
      if (res != null) {
        uploadingFiles.add(res);
      }
      notifyListeners();
    }
  }

  Future<void> _socketListener(String event, dynamic data) async {
    if (data == null) return;
    if (data is! Map<String, dynamic>) return;
    if (data['conversation_id'] != selectedChat?.uuid) return;
    switch (event) {
      case "typingResponse":
        final model = Mapper.fromMap<TypingModel>(data);
        _onTyping(model);
        break;
      case "deleteMessageResponse":
        final model = Mapper.fromMap<SocketDeleteMessageModel>(data);
        _onDelete(model);
        break;
      case "updateMessageResponse":
        final model = Mapper.fromMap<SocketMessageModel>(data);
        _onUpdate(model);
        break;
      case "newMessageResponse":
        final model = Mapper.fromMap<SocketMessageModel>(data);
        _onRecieve(model);
        break;
    }
  }

  Future<void> _onRecieve(SocketMessageModel model) async {
    if (model.documents.isNotEmpty) {
      for (final doc in model.documents) {
        final res = await documentsService.getById(doc.documentId);
        if (res == null) continue;
        model.documentStats.add(res);
      }
    }
    if (model.replyUuid != null) {
      if (model.replyUuid == threadId) {
        threadMessages.add(model);
      }
    } else {
      messages.add(model);
    }

    notifyListeners();
  }

  Future<void> _onDelete(SocketDeleteMessageModel model) async {
    if (model.replyUuid != null) {
      threadMessages.removeWhere((element) => element.uuid == model.uuid);
    } else {
      messages.removeWhere((element) => element.uuid == model.uuid);
    }

    notifyListeners();
  }

  Future<void> _onUpdate(SocketMessageModel model) async {
    messages[messages.indexOf(messages.firstWhere((element) => element.uuid == model.uuid))] = model;
    notifyListeners();
  }

  Future<void> _onTyping(TypingModel model) async {}

  void removeFile(int index) {
    if (files == null) return;
    files!.removeAt(index);
    notifyListeners();
  }

  void closeThread() {
    threadId = null;
    threadMessages.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    messageController.dispose();
    scrollController?.dispose();
    replyController.dispose();
    super.dispose();
  }
}
