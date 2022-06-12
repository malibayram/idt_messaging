import '../index.dart';

abstract class ChatRepository {
  Future<List<Chat>> getChats();
}
