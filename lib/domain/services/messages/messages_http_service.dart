import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../res/index.dart';
import '../../index.dart';

class MessagesHttpService implements MessagesRemoteRepository {
  final strings = Resources.of().strings;

  @override
  Future<List<Message>> getMessages(final String chatId, final int last) async {
    try {
      final response = await http.get(Uris.messageUri(chatId));

      if (response.statusCode != 200) {
        throw Exception(
          strings.failedToConnectWithStatusCode(
            Uris.chatsUri.toString(),
            response.statusCode,
          ),
        );
      } else {
        final fixedResponse = response.body.replaceAll("},]", "}]");

        final jsonRes = jsonDecode(fixedResponse) as List;

        return <Message>[...jsonRes.cast<Map>().map(Message.fromJson)];
      }
    } catch (e) {
      throw Exception(strings.failedToConnect(Uris.chatsUri.toString(), e));
    }
  }
}
