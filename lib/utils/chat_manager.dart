import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatManager {
  List<types.Message> messages = [];
  final user = const types.User(
    id: 'user',
  );
  final bot = const types.User(
      id: 'model',
      firstName: 'Gemini AI'
  );
  bool isLoading = false;
  late WebSocketChannel channel;

  void initializeWebsocket() {
    channel = IOWebSocketChannel.connect('ws://10.0.2.2:8000/ws');
  }

  void addMessage(types.Message message) {
    messages.insert(0, message);
    isLoading = true;
    if (message is types.TextMessage) {
      channel.sink.add(message.text);
      messages.insert(
          0,
          types.TextMessage(
            author: bot,
            createdAt: DateTime.now().millisecondsSinceEpoch,
            id: const Uuid().v4(),
            text: "",
          ));
    }
  }

  void onMessageReceived(response) {
    if (response == "<FIN>") {
      isLoading = false;
    } else {
      messages.first = (messages.first as types.TextMessage).copyWith(
          text: (messages.first as types.TextMessage).text + response);
    }
  }
}
