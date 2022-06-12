import 'package:flutter_test/flutter_test.dart';
import 'package:idt_messaging/domain/index.dart';

void main() {
  group("Chat http repository", () {
    late ChatRepository repository;
    setUp(() {
      repository = ChatHttpService();
    });
    test("Check if the instance of ChatHttpService created", () {
      expect(repository.runtimeType, ChatHttpService);
    });
    test("Get chats from the server", () async {
      final chats = await repository.getChats();

      expect(chats.runtimeType, List<Chat>);
    });
  });
  group("Chat cache repository", () {
    late ChatRepository repository;
    setUp(() {
      repository = ChatHiveService();
    });
    test("Check if the instance of ChatHttpService created", () {
      expect(repository.runtimeType, ChatHiveService);
    });
    test("Get chats from the cache", () async {
      final chats = await repository.getChats();

      expect(chats.runtimeType, List<Chat>);
    });
  });
}
