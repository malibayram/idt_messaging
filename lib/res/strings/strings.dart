part 'english_strings.dart';
part 'turkish_strings.dart';

/// Interface for app's strings
abstract class Strings {
  String get chatsScreen;
  String get messagesScreen;

  String failedToConnect(String url, Object e);
  String failedToConnectWithStatusCode(String url, int statusCode);
}
