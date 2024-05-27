import 'package:flutter/material.dart';
import 'package:yes_no_app/Domain/Entities/message.dart';

class ChatProvider with ChangeNotifier {
  List<Message> messages = [
    Message(text: 'Message 1', fromWho: FromWho.me),
    Message(text: 'Message 2', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    final message = Message(text: text, fromWho: FromWho.me);
    messages.add(message);

    notifyListeners();
  }
}
