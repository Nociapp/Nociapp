import 'package:nociapp/domain/user.dart';

abstract class IUserRepository {
  Future<User> user();
}