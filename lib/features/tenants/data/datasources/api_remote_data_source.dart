import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/tenant.dart';

class ApiRemoteDataSource {
  final String _baseUrl = 'https://docs.lawmax.app/api/saas/tenants';

  Future<List<Tenant>> getTenants(String accessToken) async {
    //print(accessToken);
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)["items"];
      return data
          .map((tenant) => Tenant(
                id: tenant['id'],
                name: tenant['name'],
              ))
          .toList();
    } else {
      throw Exception('Failed to load tenants');
    }
  }
}
