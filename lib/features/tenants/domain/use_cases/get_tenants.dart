import '../entities/tenant.dart';
import '../repositories/tenant_repository.dart';

class GetTenants {
  final TenantRepository repository;

  GetTenants(this.repository);

  Future<List<Tenant>> execute(String accessToken) async {
    return await repository.getTenants(accessToken);
  }
}
