import '../../index.dart';

abstract class ChatsCacheRepository {
  Future<List<Chat>> getChats();
  Future<bool> saveChats(final List<Chat> chats);
}
