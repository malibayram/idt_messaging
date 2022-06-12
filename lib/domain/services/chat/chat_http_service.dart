import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../res/index.dart';
import '../../index.dart';

class ChatHttpService implements ChatRepository {
  final strings = Resources.of().strings;
  @override
  Future<List<Chat>> getChats() async {
    try {
      final response = await http.get(Uris.chatsUri);

      if (response.statusCode != 200) {
        throw Exception(
          strings.failedToConnectWithStatusCode(
            Uris.chatsUri.toString(),
            response.statusCode,
          ),
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
      throw Exception(strings.failedToConnect(Uris.chatsUri.toString(), e));
    }
  }
}
