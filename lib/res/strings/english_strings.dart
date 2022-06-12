part of 'strings.dart';

class EnglishStrings extends Strings {
  @override
  String get chatsScreen => "Chats";

  @override
  String get messagesScreen => "Messages";

  @override
  String failedToConnect(String url, Object e) {
    return "Failed to connect: $url error: $e";
  }

  @override
  String failedToConnectWithStatusCode(String url, int statusCode) {
    return "Failed to connect: $url status code: $statusCode";
  }
}
