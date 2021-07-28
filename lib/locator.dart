import 'package:get_it/get_it.dart';
import 'package:spacex/data/spacex_api_client.dart';
import 'package:spacex/data/spacex_repository.dart';
import 'package:spacex/viewmodels/spacex_view_model.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => SpaceXRepository());
  locator.registerLazySingleton(() => SpaceXApiClient());
  locator.registerFactory(() => SpaceXViewModel());
}
