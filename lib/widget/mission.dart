import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex/viewmodels/spacex_view_model.dart';

class MissionWidget extends StatelessWidget {
  //final String mission;

  //MissionWidget({@required this.mission});

  @override
  Widget build(BuildContext context) {
    final _spaceXViewModel = Provider.of<SpaceXViewModel>(context);

    var missionName = _spaceXViewModel.handedSpaceX.name;
    return Text(
      missionName,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
