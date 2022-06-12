import '../../index.dart';

class MessagesHiveService implements MessagesCacheRepository {
  final _messages = <Message>[];

  @override
  Future<List<Message>> getMessages(final String chatId) async {
    return _messages;
  }

  @override
  Future<bool> saveMessages(List<Message> messages) async {
    _messages.clear();

    _messages.addAll(messages);

    return true;
  }
}
