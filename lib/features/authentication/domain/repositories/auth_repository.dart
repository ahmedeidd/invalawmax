import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> authenticate(String username, String password);
}
