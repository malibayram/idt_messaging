import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idt_messaging/blocs/index.dart';
import 'package:idt_messaging/domain/index.dart';

void main() {
  final cacheService = MessagesHiveService();
  final remoteService = MessagesHttpService();

  final messagesCubit = MessagesCubit(
    cacheService: cacheService,
    remoteService: remoteService,
  );

  List<Message> remoteMessagees = [];

  setUp(() async {
    final messages = await remoteService.getMessages("9991", 0);

    remoteMessagees = messages;
  });

  group("[MessagesCubit]", () {
    test('should have [MessagesInitial] on start', () {
      expect(messagesCubit.state is MessagesInitial, true);
    });

    blocTest<MessagesCubit, MessagesState>(
      'When getMessages method called '
      'should messages on server be loaded',
      build: () => messagesCubit,
      act: (bloc) => bloc.getMessages("9991"),
      wait: const Duration(seconds: 2),
      expect: () {
        return [const MessagesLoading(), MessagesLoaded(remoteMessagees)];
      },
    );
  });
}
