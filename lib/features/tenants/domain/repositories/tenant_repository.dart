import '../entities/tenant.dart';

abstract class TenantRepository {
  Future<List<Tenant>> getTenants(String accessToken);
}
