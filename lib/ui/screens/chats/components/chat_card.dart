import 'package:flutter/material.dart';
import 'package:idt_messaging/domain/index.dart';
import 'package:idt_messaging/res/index.dart';

class ChatCard extends StatelessWidget {
  ChatCard({super.key, required this.chat, required this.onPressed});

  final Chat chat;
  final VoidCallback onPressed;

  final dimension = Resources.of().dimension;
  final color = Resources.of().color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: dimension.bigMargin,
          vertical: dimension.bigMargin * 0.75,
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  child: Text(
                    chat.topic.substring(0, 2),
                    style: TextStyle(fontSize: dimension.bigText),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      color: color.accent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: dimension.bigMargin,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.topic,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        chat.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text("${chat.modifiedAtDateTime.timeDifference} ago"),
            ),
          ],
        ),
      ),
    );
  }
}
