import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/index.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit({
    required this.cacheService,
    required this.remoteService,
  }) : super(MessagesInitial());

  final MessagesCacheRepository cacheService;
  final MessagesRemoteRepository remoteService;

  Future<void> getMessages(final String chatId) async {
    emit(const MessagesLoading());

    int lastCachedMessageTimestamp = 0;
    Exception? exception;

    try {
      final localMessages = await cacheService.getMessages(chatId);

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

      final localMessages = await cacheService.getMessages(chatId);

      if (!isClosed) emit(MessagesLoaded(localMessages));
    } on Exception catch (e) {
      if (exception != null) exception = e;
    }

    if (exception != null && !isClosed) emit(MessagesLoadingFailed(exception));
  }
}
