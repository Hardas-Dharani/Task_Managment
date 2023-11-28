
abstract class AuthenticationRepository {
  Future<Map<String, dynamic>> signIn(String username, String password);
}
