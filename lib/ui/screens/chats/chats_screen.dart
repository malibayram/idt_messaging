import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:idt_messaging/ui/screens/messages/messages_screen.dart';

import '../../../blocs/index.dart';
import '../../../domain/index.dart';
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
              FlutterNativeSplash.remove();

              return Text("${state.exception}");
            } else if (state is ChatsLoaded) {
              FlutterNativeSplash.remove();

              return ListView(
                children: [
                  for (final chat in state.chats)
                    ChatCard(
                      chat: chat,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) {
                            final cacheService = MessagesHiveService();
                            final remoteService = MessagesHttpService();

                            return BlocProvider(
                              create: (context) => MessagesCubit(
                                cacheService: cacheService,
                                remoteService: remoteService,
                              ),
                              child: MessagesScreen(chat: chat),
                            );
                          }),
                        );
                      },
                    ),
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
