import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idt_messaging/domain/index.dart';

void main() {
  const jsonString =
      '{"id" : "1003", "message" : "How about tomorrow then?", "modified_at" : 1599814026153, "sender" : "John"}';

  Message? message;

  test(
    "Try to create a Message instance with default constructor with empty id",
    () {
      try {
        message = Message(
          id: "",
          message: "How about tomorrow then?",
          modifiedAt: 1599814026153,
          sender: "John",
        );
      } catch (e) {
        debugPrint(e.toString());
      }

      expect(message, null);
    },
  );
  test("Create a Message instance with default constructor", () {
    final instance = Message(
      id: "1003",
      message: "How about tomorrow then?",
      modifiedAt: 1599814026153,
      sender: "John",
    );

    message = instance;

    expect(message, instance);
  });

  test("Create a Message instance from json string", () {
    final instance = Message.fromJson(jsonDecode(jsonString) as Map);

    message = instance;

    expect(message, instance);
  });

  test("Modify the Message instance with changing last message", () {
    final newInstance =
        message?.modifyWith(message: "Hei how about some pizza tonight?");

    message = newInstance;

    expect(message?.message, "Hei how about some pizza tonight?");
  });
}
