import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/user.dart';

class AuthRemoteDataSource {
  final String _tokenUrl = 'https://docs.lawmax.app/connect/token';

  Future<User> authenticate(String username, String password) async {
    final response = await http.post(
      Uri.parse(_tokenUrl),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'client_id': 'InvLawMaxDoc_Flutter',
        'client_secret': '1q2w3e*',
        'grant_type': 'password',
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return User(
        accessToken: data['access_token'],
      );
    } else {
      throw Exception('Failed to authenticate: ${response.body}');
    }
  }
}
