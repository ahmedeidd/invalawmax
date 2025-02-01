import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class AuthenticateUser {
  final AuthRepository repository;

  AuthenticateUser(this.repository);

  Future<User> execute(String username, String password) async {
    return await repository.authenticate(username, password);
  }
}
