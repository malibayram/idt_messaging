import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../res/index.dart';
import '../../index.dart';

class ChatHttpService implements ChatRepository {
  @override
  Future<List<Chat>> getChats() async {
    try {
      final response = await http.get(Uris.chatsUri);

      if (response.statusCode != 200) {
        throw Exception(
          "Failed to connect: ${Uris.chatsUri} status code: ${response.statusCode}",
        );
      } else {
        // There is a format arror in response of the server
        // Exception: Failed to connect: https://idtm-media.s3.amazonaws.com/programming-test/api/inbox.json error: FormatException: Unexpected character (at character 435)
        //..."Mum", "Dad", "Bro"],"topic" : "pictures", "modified_at" : 1512814026153},]
        final fixedResponse = response.body.replaceAll('},]', "}]");

        final jsonRes = jsonDecode(fixedResponse) as List;

        return <Chat>[...jsonRes.cast<Map>().map(Chat.fromJson)];
      }
    } catch (e) {
      throw Exception("Failed to connect: ${Uris.chatsUri} error: $e");
    }
  }
}
