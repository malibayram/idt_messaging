import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idt_messaging/blocs/index.dart';
import 'package:idt_messaging/domain/index.dart';

import '../../../../res/index.dart';

class ChatInputField extends StatelessWidget {
  ChatInputField({super.key, required this.chatId});

  final String chatId;

  final dimension = Resources.of().dimension;
  final color = Resources.of().color;

  @override
  Widget build(BuildContext context) {
    final textEditCtrlr = TextEditingController(text: "");

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: dimension.bigMargin,
        vertical: dimension.bigMargin / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 32,
            color: const Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Icon(Icons.mic, color: color.primary),
            SizedBox(width: dimension.bigMargin),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: dimension.bigMargin * 0.75,
                ),
                decoration: BoxDecoration(
                  color: color.primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textEditCtrlr,
                        decoration: const InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(width: dimension.bigMargin / 4),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (textEditCtrlr.text.isNotEmpty) {
                  final rId = 9000 + Random().nextInt(1000);
                  final message = Message(
                    id: "$rId",
                    message: textEditCtrlr.text,
                    modifiedAt: DateTime.now().millisecondsSinceEpoch,
                    sender: "me",
                  );
                  textEditCtrlr.text = "";

                  context.read<MessagesCubit>().sendMessage(message);
                }
              },
              icon: const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
