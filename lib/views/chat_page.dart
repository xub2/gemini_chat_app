import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:gemini_chat_app/utils/chat_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatManager chatManager = ChatManager();

  @override
  void initState() {
    chatManager.initializeWebsocket();
    chatManager.channel.stream.listen((event) {
      chatManager.onMessageReceived(event);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chat(
        messages: chatManager.messages,
        onAttachmentPressed: _handleImageSelection,
        onSendPressed: _handleSendPressed,
        showUserAvatars: false,
        showUserNames: true,
        user: chatManager.user,
        theme: const DefaultChatTheme(
          backgroundColor: Colors.white,
          inputBorderRadius: BorderRadius.zero,
          receivedMessageBodyTextStyle: TextStyle(color: Colors.white),
          sentMessageBodyBoldTextStyle: TextStyle(color: Colors.white),
          primaryColor: Color(0xff25429a),
          secondaryColor: Color(0xff203575),
          attachmentButtonIcon: Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
          ),
          inputBackgroundColor: Color(0xFF223E9A),
          seenIcon: Text(
            'read',
            style: TextStyle(
              fontSize: 10.0,
            ),
          ),
          userAvatarNameColors: [Colors.white
          ],
        ),
        l10n: const CustomChatL10n(),
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    if (!chatManager.isLoading) {
      final textMessage = types.TextMessage(
        author: chatManager.user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: message.text,
      );
      chatManager.addMessage(textMessage);
      setState(() {});
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: chatManager.user,
        createdAt: DateTime
            .now()
            .millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      chatManager.addMessage(message);
    }
  }
}

class CustomChatL10n extends ChatL10n {
  const CustomChatL10n(): super(
    attachmentButtonAccessibilityLabel: '첨부 파일 버튼',
    emptyChatPlaceholder: '궁금한 내용이 있으신가요?',
    fileButtonAccessibilityLabel: '파일 버튼',
    inputPlaceholder: '메세지를 입력해주세요',
    isTyping: '입력 중...',
    sendButtonAccessibilityLabel: '전송 버튼',
    unreadMessagesLabel: '읽지 않은 메시지',
    others: '다른 사용자',
    and: '그리고',
  );
}