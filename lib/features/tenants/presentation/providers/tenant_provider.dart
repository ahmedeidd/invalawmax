import 'package:flutter/material.dart';
import '../../domain/entities/tenant.dart';
import '../../domain/use_cases/get_tenants.dart';

class TenantProvider with ChangeNotifier {
  final GetTenants _getTenants;
  List<Tenant> _tenants = [];
  bool _isLoading = false;
  String? _error;

  TenantProvider(this._getTenants);

  List<Tenant> get tenants => _tenants;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchTenants(String accessToken) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _tenants = await _getTenants.execute(accessToken);
      _error = null;
    } catch (e) {
      _error = e.toString();
      _tenants = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
