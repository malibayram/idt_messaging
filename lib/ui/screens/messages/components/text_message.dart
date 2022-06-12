import 'package:flutter/material.dart';

import '../../../../domain/index.dart';
import '../../../../res/index.dart';

class TextMessage extends StatelessWidget {
  TextMessage({super.key, required this.message});

  final Message message;

  final dimension = Resources.of().dimension;
  final color = Resources.of().color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: message.sender == "me"
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (message.sender != "me")
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 4.0),
            child: CircleAvatar(
              radius: 14,
              child: Text(message.sender.substring(0, 2).toUpperCase()),
            ),
          ),
        Expanded(
          child: Align(
            alignment: message.sender == "me"
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(
                right: dimension.bigMargin * 0.75,
                top: dimension.bigMargin / 2,
                bottom: dimension.bigMargin / 2,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: dimension.bigMargin * 0.75,
                vertical: dimension.bigMargin / 2,
              ),
              decoration: BoxDecoration(
                color:
                    color.primary.withOpacity(message.sender == "me" ? 1 : 0.2),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    message.sender == "me" ? 0 : dimension.bigMargin,
                  ),
                  topLeft: Radius.circular(
                    message.sender != "me" ? 0 : dimension.bigMargin,
                  ),
                  bottomLeft: Radius.circular(dimension.bigMargin),
                  bottomRight: Radius.circular(dimension.bigMargin),
                ),
              ),
              child: Column(
                crossAxisAlignment: message.sender == "me"
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: [
                  if (message.sender != "me")
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Text(
                        message.sender,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  Text(
                    message.message,
                    style: TextStyle(
                      color: message.sender == "me"
                          ? Colors.white
                          : Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  SizedBox(height: dimension.smallMargin),
                  Text(
                    "${message.modifiedAtDateTime.timeDifference} ago",
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
