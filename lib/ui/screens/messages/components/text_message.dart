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
    return Align(
      alignment:
          message.sender == "me" ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: dimension.bigMargin * 0.75,
          vertical: dimension.bigMargin / 2,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: dimension.bigMargin * 0.75,
          vertical: dimension.bigMargin / 2,
        ),
        decoration: BoxDecoration(
          color: color.primary.withOpacity(message.sender == "me" ? 1 : 0.2),
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
    );
  }
}
