import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiClient {
  final http.Client _client;
  ApiClient(
    this._client,
  );
//* get api call
  Future<dynamic> get(String path) async {
    final response = await _client.get(Uri.parse(path)).timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        return http.Response('Error', 500);
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }
}
