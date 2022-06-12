import '../../index.dart';

class ChatsHiveService implements ChatsCacheRepository {
  final _chats = <Chat>[];

  @override
  Future<List<Chat>> getChats() async {
    return _chats;
  }

  @override
  Future<bool> saveChats(List<Chat> chats) async {
    _chats.clear();

    _chats.addAll(chats);

    return true;
  }
}
