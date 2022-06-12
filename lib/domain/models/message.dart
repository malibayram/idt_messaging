import 'package:equatable/equatable.dart';

class Message extends Equatable {
  Message({
    required this.id,
    required this.message,
    required this.modifiedAt,
    required this.sender,
  }) : assert(
          id.isNotEmpty,
          "Message id can not be empty! Please provide an id",
        );

  factory Message.fromJson(Map json) {
    return Message(
      id: json['id'],
      message: json['message'],
      modifiedAt: json['modified_at'],
      sender: json['sender'],
    );
  }

  final String id;
  final String message;
  final int modifiedAt;
  final String sender;

  DateTime get modifiedAtDateTime {
    return DateTime.fromMillisecondsSinceEpoch(modifiedAt);
  }

  Message modifyWith({final String? message}) {
    final modificationTime = DateTime.now();

    return Message(
      id: id,
      message: message ?? this.message,
      modifiedAt: modificationTime.millisecondsSinceEpoch,
      sender: sender,
    );
  }

  // Since the sender can not be modified, we don't need to add it to the comparision's list
  @override
  List<Object?> get props => [id, message, modifiedAt];
}
