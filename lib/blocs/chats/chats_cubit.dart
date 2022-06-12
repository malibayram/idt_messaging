import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/index.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit({
    required this.cacheService,
    required this.remoteService,
  }) : super(ChatsInitial());

  final ChatsCacheRepository cacheService;
  final ChatsRemoteRepository remoteService;

  Future<void> getChats() async {
    emit(const ChatsLoading());

    int lastCachedChatTimestamp = 0;
    Exception? exception;

    try {
      final localChats = await cacheService.getChats();

      if (localChats.isNotEmpty) {
        localChats.sort();

        lastCachedChatTimestamp = localChats.last.modifiedAt;

        if (!isClosed) emit(ChatsLoaded(localChats));
      }
    } on Exception catch (e) {
      exception = e;
    }

    try {
      final remoteChats = await remoteService.getChats(lastCachedChatTimestamp);

      await cacheService.saveChats(remoteChats);

      final localChats = await cacheService.getChats();

      if (!isClosed) emit(ChatsLoaded(localChats));
    } on Exception catch (e) {
      if (exception != null) exception = e;
    }

    if (exception != null && !isClosed) emit(ChatsLoadingFailed(exception));
  }
}
