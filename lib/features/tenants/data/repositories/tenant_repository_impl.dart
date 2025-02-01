import '../../domain/entities/tenant.dart';
import '../../domain/repositories/tenant_repository.dart';
import '../datasources/api_remote_data_source.dart';

class TenantRepositoryImpl implements TenantRepository {
  final ApiRemoteDataSource _remoteDataSource;

  TenantRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Tenant>> getTenants(String accessToken) async {
    return await _remoteDataSource.getTenants(accessToken);
  }
}
