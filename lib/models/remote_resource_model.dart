

class RemoteResource {
  static String endpoint = "";

  static List<RemoteResource> _allFromServer = [];

  static List<RemoteResource> get allFromServer => _allFromServer;

  static void _checkEndpoint() {
    if ((endpoint.trim().length == 0))
      throw new Exception(
          "Variable 'endpoint' cant be empty. Please try setting the API Endpoint first.");
  }

  static Future<List<RemoteResource>> getAll({bool force = false}) async {
    _checkEndpoint();

  }
}
