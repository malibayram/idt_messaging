class Uris {
  static const _hostName = "idtm-media.s3.amazonaws.com";

  static final chatsUri = Uri(
    scheme: "https",
    host: _hostName,
    pathSegments: [
      "programming-test",
      "api",
      "inbox.json",
    ],
  );

  static Uri messageUri(String chatId) {
    return Uri(
      scheme: "https",
      host: _hostName,
      pathSegments: [
        "programming-test",
        "api",
        "$chatId.json",
      ],
    );
  }

  static final randomMessageUri = Uri(
    scheme: "https",
    host: "api.quotable.io",
    pathSegments: ["random"],
  );
}
