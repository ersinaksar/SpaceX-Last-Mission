import 'package:spacex/data/spacex_api_client.dart';
import 'package:spacex/locator.dart';
import 'package:spacex/models/spacex.dart';

class SpaceXRepository {
  SpaceXApiClient spaceXApiClient = locator<SpaceXApiClient>();

  Future<SpaceX> getSpaceX() async {
    return await spaceXApiClient.getSpaceX();
  }
}
