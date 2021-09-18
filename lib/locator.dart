import 'package:get_it/get_it.dart';
import 'package:spacex/data/spacex_api_client.dart';
import 'package:spacex/data/spacex_repository.dart';
import 'package:spacex/repository/user_repository.dart';
import 'package:spacex/services/firebase_auth_service.dart';
import 'package:spacex/services/firestore_db_service.dart';
import 'package:spacex/viewmodels/spacex_view_model.dart';

GetIt locator = GetIt.instance;
//registerFactory istekte bulunduğumuzda her seferinde yeni bir nesne üretiyor
void setupLocator() {
  locator.registerLazySingleton(() => SpaceXRepository());
  locator.registerLazySingleton(() => SpaceXApiClient());
  locator.registerFactory(() => SpaceXViewModel());

  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => FireStoreDBService());
}
