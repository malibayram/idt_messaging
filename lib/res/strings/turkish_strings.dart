part of 'strings.dart';

class TurkishStrings extends Strings {
  @override
  String get chatsScreen => "Konuşmalar";

  @override
  String get messagesScreen => "Mesajlar";

  @override
  String failedToConnect(String url, Object e) {
    return "$url adresine bağlanırken hata oluştu! Hata: $e";
  }

  @override
  String failedToConnectWithStatusCode(String url, int statusCode) {
    return "$url adresine bağlanırken hata oluştu! Durum kodu: $statusCode";
  }
}
