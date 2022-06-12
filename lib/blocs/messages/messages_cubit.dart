import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../domain/index.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit({
    required this.cacheService,
    required this.remoteService,
    required this.chatId,
  }) : super(MessagesInitial());

  final MessagesCacheRepository cacheService;
  final MessagesRemoteRepository remoteService;
  final String chatId;
  final localMessages = <Message>[];

  Future<void> getMessages() async {
    emit(const MessagesLoading());

    int lastCachedMessageTimestamp = 0;
    Exception? exception;

    try {
      localMessages.addAll(await cacheService.getMessages(chatId));

      if (localMessages.isNotEmpty) {
        localMessages.sort();

        lastCachedMessageTimestamp = localMessages.last.modifiedAt;

        if (!isClosed) emit(MessagesLoaded(localMessages));
      }
    } on Exception catch (e) {
      exception = e;
    }

    try {
      final remoteMessages =
          await remoteService.getMessages(chatId, lastCachedMessageTimestamp);

      await cacheService.saveMessages(remoteMessages);

      localMessages.addAll(await cacheService.getMessages(chatId));

      if (!isClosed) emit(MessagesLoaded(localMessages));
    } on Exception catch (e) {
      if (exception != null) exception = e;
    }

    if (exception != null && !isClosed) emit(MessagesLoadingFailed(exception));
  }

  Future<void> sendMessage(final Message message) async {
    localMessages.add(message);

    emit(const MessagesLoading());
    emit(MessagesLoaded(localMessages));

    try {
      await Future.delayed(
          Duration(milliseconds: 500 + Random().nextInt(1000)));
      final m = await remoteService.getRandomMessage();
      localMessages.add(m);
      if (!isClosed) {
        emit(const MessagesLoading());
        emit(MessagesLoaded(localMessages));
      }
    } catch (e) {
      debugPrint("$e");
    }
  }
}
