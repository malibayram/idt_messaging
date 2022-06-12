import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/index.dart';
import '../../../res/index.dart';
import '../index.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});

  final strings = Resources.of().strings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(strings.chatsScreen)),
      body: Center(
        child: BlocBuilder<ChatsCubit, ChatsState>(
          builder: (context, state) {
            if (state is ChatsInitial) {
              context.read<ChatsCubit>().getChats();
            }

            if (state is ChatsLoadingFailed) {
              return Text("${state.exception}");
            } else if (state is ChatsLoaded) {
              return ListView(
                children: [
                  for (final chat in state.chats)
                    ChatCard(chat: chat, onPressed: () {}),
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
