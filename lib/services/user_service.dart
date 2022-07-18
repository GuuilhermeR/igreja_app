import 'package:flutter/cupertino.dart';
import 'package:igreja_app/models/repository/user_repository.dart';
import 'package:igreja_app/models/user/user.dart';

class UserService {
  Future<User> createUser(User user, BuildContext context) {
    UserRepository userRepository = UserRepository();
    return userRepository.createUser(user, context);
  }
}
