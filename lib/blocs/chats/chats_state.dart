part of 'chats_cubit.dart';

@immutable
abstract class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object?> get props => [];
}

class ChatsInitial extends ChatsState {}

class ChatsLoading extends ChatsState {
  const ChatsLoading();
}

class ChatsLoadingFailed extends ChatsState {
  const ChatsLoadingFailed(this.exception);

  final Exception exception;

  @override
  List<Object?> get props => [exception];
}

class ChatsLoaded extends ChatsState {
  const ChatsLoaded(this.chats);

  final List<Chat> chats;

  @override
  List<Object?> get props => [chats];
}
