import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idt_messaging/domain/index.dart';

void main() {
  const jsonString =
      '{"id" : "9991","last_message" : "How about tomorrow then?","members" : ["John", "Daniel", "Rachel"],"topic" : "pizza night", "modified_at" : 1599814026153}';

  Chat? chat;

  test(
    "Try to create a Chat instance with default constructor with empty id",
    () {
      try {
        chat = Chat(
          id: "",
          lastMessage: "How about tomorrow then?",
          members: const ["John", "Daniel", "Rachel"],
          topic: "pizza night",
          modifiedAt: 1599814026153,
        );
      } catch (e) {
        debugPrint(e.toString());
      }

      expect(chat, null);
    },
  );
  test("Create a Chat instance with default constructor", () {
    final instance = Chat(
      id: "9991",
      lastMessage: "How about tomorrow then?",
      members: const ["John", "Daniel", "Rachel"],
      topic: "pizza night",
      modifiedAt: 1599814026153,
    );

    chat = instance;

    expect(chat, instance);
  });

  test("Create a Chat instance from json string", () {
    final instance = Chat.fromJson(jsonDecode(jsonString) as Map);

    chat = instance;

    expect(chat, instance);
  });

  test("Modify the Chat instance with changing last message", () {
    final newInstance =
        chat?.modifyWith(lastMessage: "I will send them to you asap");

    chat = newInstance;

    expect(chat?.lastMessage, "I will send them to you asap");
  });
}
