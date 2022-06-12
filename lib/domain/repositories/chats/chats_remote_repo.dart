import '../../index.dart';

abstract class ChatsRemoteRepository {
  Future<List<Chat>> getChats(final int lastModifiedTime);
}
