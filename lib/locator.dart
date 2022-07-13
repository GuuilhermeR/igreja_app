import 'package:get_it/get_it.dart';
import 'package:igreja_app/models/user/service/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api('users'));
}
