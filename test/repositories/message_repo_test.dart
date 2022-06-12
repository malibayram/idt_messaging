import 'package:flutter_test/flutter_test.dart';
import 'package:idt_messaging/domain/index.dart';

void main() {
  group("Message http repository", () {
    late MessageRepository repository;
    setUp(() {
      repository = MessageHttpService();
    });
    test("Check if the instance of MessageHttpService created", () {
      expect(repository.runtimeType, MessageHttpService);
    });
    test("Get messages from the server", () async {
      final messages = await repository.getMessages("9991");

      expect(messages.runtimeType, List<Message>);
    });
  });
  group("Message cache repository", () {
    late MessageRepository repository;
    setUp(() {
      repository = MessageHiveService();
    });
    test("Check if the instance of MessageHttpService created", () {
      expect(repository.runtimeType, MessageHiveService);
    });
    test("Get messages from the cache", () async {
      final messages = await repository.getMessages("9991");

      expect(messages.runtimeType, List<Message>);
    });
  });
}
