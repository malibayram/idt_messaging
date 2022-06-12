import '../../index.dart';

abstract class MessagesRemoteRepository {
  Future<List<Message>> getMessages(final String chatId, final int last);
}
