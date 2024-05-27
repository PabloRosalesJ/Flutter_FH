import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/Domain/Entities/message.dart';
import 'package:yes_no_app/Presentation/Providers/chat_provider.dart';
import 'package:yes_no_app/Presentation/Widgets/Chat/here_message_bubble.dart';
import 'package:yes_no_app/Presentation/Widgets/Chat/my_message_bubble.dart';
import 'package:yes_no_app/Presentation/Widgets/Shared/message_field_box.dart';

// -- Como regla si lleva la palabra Screen, este debe retornar un Scaffold
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://scontent.fmex10-4.fna.fbcdn.net/v/t39.30808-6/365789448_854093012900759_4312687213169766477_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeH-LdddoDhe64LCTZgMztBq3gR0MUC3os_eBHQxQLeizzAPVFQKEAo0jtXsNwIeyGlblrUJy6DVAW50sGYA8v6h&_nc_ohc=9tKhQHGRsA8Q7kNvgHDf2V9&_nc_ht=scontent.fmex10-4.fna&oh=00_AYDMkcgk3Qv-CgwwTfrmPRUla3yiDPiAvmGCfFNmZ_LQxw&oe=66574321'),
          ),
        ),
        title: const Text('Pili ❤️'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // -- Le da al widget todo el alto (disponible) del body
            Expanded(
                // -- Builder permite pasar data dinámica
                child: ListView.builder(
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];

                return (message.fromWho == FromWho.here)
                    ? const HereMessageBubble()
                    : MyMessageBubble(message: message);
              },
            )),
            const MessageField(),
          ],
        ),
      ),
    );
  }
}
