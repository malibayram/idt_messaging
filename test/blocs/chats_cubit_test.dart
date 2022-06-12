import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idt_messaging/blocs/index.dart';
import 'package:idt_messaging/domain/index.dart';

void main() {
  final cacheService = ChatsHiveService();
  final remoteService = ChatsHttpService();

  final chatsCubit = ChatsCubit(
    cacheService: cacheService,
    remoteService: remoteService,
  );

  List<Chat> remoteChates = [];

  setUp(() async {
    final chats = await remoteService.getChats(0);

    remoteChates = chats;
  });

  group("[ChatsCubit]", () {
    test('should have [ChatsInitial] on start', () {
      expect(chatsCubit.state is ChatsInitial, true);
    });

    blocTest<ChatsCubit, ChatsState>(
      'When getChats method called '
      'should chats on server be loaded',
      build: () => chatsCubit,
      act: (bloc) => bloc.getChats(),
      wait: const Duration(seconds: 2),
      expect: () {
        return [const ChatsLoading(), ChatsLoaded(remoteChates)];
      },
    );
  });
}
