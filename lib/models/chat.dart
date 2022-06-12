class Chat {
  // Put constructor to top => https://github.com/flutter/flutter/issues/1220#issuecomment-172157484
  Chat({
    required this.id,
    required this.lastMessage,
    required this.members,
    required this.topic,
    required this.modifiedAt,
  }) : assert(id.isNotEmpty, "Chat id can not be empty! Please provide an id");

  factory Chat.fromJson(Map json) {
    return Chat(
      id: json['id'],
      lastMessage: json['last_message'],
      members: json['members'].cast<String>(),
      topic: json['topic'],
      modifiedAt: json['modified_at'],
    );
  }

  final String id;
  final String lastMessage;
  final List<String> members;
  final String topic;
  final int modifiedAt;

  DateTime get modifiedAtDateTime {
    return DateTime.fromMillisecondsSinceEpoch(modifiedAt);
  }

  Chat modifyWith({
    final String? lastMessage,
    final List<String>? members,
    final String? topic,
  }) {
    final modificationTime = DateTime.now();

    return Chat(
      id: id,
      lastMessage: lastMessage ?? this.lastMessage,
      members: members ?? this.members,
      topic: topic ?? this.topic,
      modifiedAt: modificationTime.millisecondsSinceEpoch,
    );
  }

  /// if the ids of instances are the same I assume both of the instance are equal
  /// if I need to deep comparition between instances I can add other properties here
  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) {
    return other is Chat && other.id == id;
  }
}
