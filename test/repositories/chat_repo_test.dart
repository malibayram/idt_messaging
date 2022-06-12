import 'package:flutter_test/flutter_test.dart';
import 'package:idt_messaging/domain/index.dart';

void main() {
  group("Chat http repository", () {
    late ChatsRemoteRepository repository;
    setUp(() {
      repository = ChatsHttpService();
    });
    test("Check if the instance of ChatsHttpService created", () {
      expect(repository.runtimeType, ChatsHttpService);
    });
    test("Get chats from the server", () async {
      final chats = await repository.getChats(0);

      expect(chats.runtimeType, List<Chat>);
    });
  });

  group("Chat cache repository", () {
    late ChatsCacheRepository repository;
    setUp(() {
      repository = ChatsHiveService();
    });
    test("Check if the instance of ChatsHttpService created", () {
      expect(repository.runtimeType, ChatsHiveService);
    });
    test("Get chats from the cache", () async {
      final chats = await repository.getChats();

      expect(chats.runtimeType, List<Chat>);
    });
    test("Save chats to the cache", () async {
      final result = await repository.saveChats([]);

      expect(result, true);
    });
  });
}
