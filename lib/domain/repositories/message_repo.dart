import '../index.dart';

abstract class MessageRepository {
  Future<List<Message>> getMessages(final String chatId);
}
