import '../../index.dart';

abstract class MessagesCacheRepository {
  Future<List<Message>> getMessages(final String chatId);
  Future<bool> saveMessages(final List<Message> messages);
}
