import '../index.dart';

class ChatRepositories {
  ChatRepositories({
    required this.cacheService,
    required this.remoteService,
  });

  final ChatCacheService cacheService;
  final ChatRemoteService remoteService;

  List<Chat> getChats() {
    return [];
  }
}
