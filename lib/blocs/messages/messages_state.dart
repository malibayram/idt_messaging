part of 'messages_cubit.dart';

@immutable
abstract class MessagesState extends Equatable {
  const MessagesState();

  @override
  List<Object?> get props => [];
}

class MessagesInitial extends MessagesState {}

class MessagesLoading extends MessagesState {
  const MessagesLoading();
}

class MessagesLoadingFailed extends MessagesState {
  const MessagesLoadingFailed(this.exception);

  final Exception exception;

  @override
  List<Object?> get props => [exception];
}

class MessagesLoaded extends MessagesState {
  const MessagesLoaded(this.messages);

  final List<Message> messages;

  @override
  List<Object?> get props => [messages];
}
