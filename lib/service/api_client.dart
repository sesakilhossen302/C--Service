class ApiClient {
  final String baseUrl;

  ApiClient({required this.baseUrl});

  Future<dynamic> getData(String uri) async {
    // Network GET request logic wrapper
  }

  Future<dynamic> postData(String uri, dynamic body) async {
    // Network POST request logic wrapper
  }
}
