import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacex/models/spacex.dart';

class SpaceXApiClient {
  static const baseUrl = "https://api.spacexdata.com/v4/launches/latest";
  final http.Client httpClient = http.Client();

  /*
  Future<String> getDetails() async {
    final details = "https://api.spacexdata.com/v4/launches/latest";
    final incominganswer = await httpClient.get(details);

    if (incominganswer.statusCode != 200) {
      throw Exception("Data could not be brought");
    }

    final incominganswerJSON = (jsonDecode(incominganswer.body));
    return incominganswerJSON["details"];
  }*/

  Future<SpaceX> getSpaceX() async {
    final spaceXMissionURL = baseUrl;
    Uri url = Uri.parse(spaceXMissionURL);
    final missionIncomingAnswer = await httpClient.get(url);
    if (missionIncomingAnswer.statusCode != 200) {
      throw Exception("Data could not be brought");
    }

    final missionIncomingAnswerJSON = (jsonDecode(missionIncomingAnswer.body));
    return SpaceX.fromJson(missionIncomingAnswerJSON);
  }
}
