import 'package:flutter_test/flutter_test.dart';
import 'package:idt_messaging/domain/index.dart';

void main() {
  group("Message http repository", () {
    late MessagesRemoteRepository repository;
    setUp(() {
      repository = MessagesHttpService();
    });
    test("Check if the instance of MessageHttpService created", () {
      expect(repository.runtimeType, MessagesHttpService);
    });
    test("Get messages from the server", () async {
      final messages = await repository.getMessages("9991", 0);

      expect(messages.runtimeType, List<Message>);
    });
  });

  group("Message cache repository", () {
    late MessagesCacheRepository repository;
    setUp(() {
      repository = MessagesHiveService();
    });
    test("Check if the instance of MessageHttpService created", () {
      expect(repository.runtimeType, MessagesHiveService);
    });
    test("Get messages from the cache", () async {
      final messages = await repository.getMessages("9991");

      expect(messages.runtimeType, List<Message>);
    });
  });
}
