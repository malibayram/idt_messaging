import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idt_messaging/ui/screens/messages/components/text_message.dart';

import '../../../blocs/index.dart';
import '../../../domain/index.dart';
import '../../../res/index.dart';
import 'components/chat_input_field.dart';

class MessagesScreen extends StatelessWidget {
  MessagesScreen({super.key, required this.chat});

  final Chat chat;

  final dimension = Resources.of().dimension;
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const BackButton(),
            CircleAvatar(
              radius: 24,
              child: Text(
                chat.topic.substring(0, 2).toUpperCase(),
                style: TextStyle(fontSize: dimension.bigText),
              ),
            ),
            SizedBox(width: dimension.bigMargin * 0.75),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chat.topic,
                  style: const TextStyle(fontSize: 16),
                ),
                const Text(
                  "Online",
                  style: TextStyle(fontSize: 12),
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.local_phone),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.security),
            onPressed: () {},
          ),
          SizedBox(width: dimension.bigMargin / 2),
        ],
      ),
      body: Center(
        child: BlocBuilder<MessagesCubit, MessagesState>(
          builder: (context, state) {
            if (state is MessagesInitial) {
              context.read<MessagesCubit>().getMessages();
            }
            if (state is MessagesLoadingFailed) {
              return Text("${state.exception}");
            } else if (state is MessagesLoaded) {
              Future.delayed(const Duration(milliseconds: 50)).whenComplete(() {
                _controller.jumpTo(_controller.position.maxScrollExtent);
              });

              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      controller: _controller,
                      children: [
                        for (final message in state.messages)
                          TextMessage(message: message)
                      ],
                    ),
                  ),
                  ChatInputField(chatId: chat.id),
                ],
              );
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
