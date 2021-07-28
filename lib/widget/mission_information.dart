import 'package:flutter/material.dart';

class MissionInformationWidget extends StatelessWidget {
  String missionDetails;
  MissionInformationWidget({@required this.missionDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Mission Start: " + 23.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Mission End: " + 56.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),*/
        Text(
          missionDetails,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}
