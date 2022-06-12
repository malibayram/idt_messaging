import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../res/index.dart';
import '../../index.dart';

class MessageHttpService implements MessageRepository {
  @override
  Future<List<Message>> getMessages(final String chatId) async {
    try {
      final response = await http.get(Uris.messageUri(chatId));

      if (response.statusCode != 200) {
        throw Exception(
          "Failed to connect: ${Uris.messageUri(chatId)} status code: ${response.statusCode}",
        );
      } else {
        final fixedResponse = response.body.replaceAll('},]', "}]");

        final jsonRes = jsonDecode(fixedResponse) as List;

        return <Message>[...jsonRes.cast<Map>().map(Message.fromJson)];
      }
    } catch (e) {
      throw Exception(
        "Failed to connect: ${Uris.messageUri(chatId)} error: $e",
      );
    }
  }
}
