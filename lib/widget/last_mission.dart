import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:spacex/viewmodels/spacex_view_model.dart';

class LastMissionWidget extends StatelessWidget {
  const LastMissionWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _spaceXViewModel = Provider.of<SpaceXViewModel>(context);
    var fireDateUtc = _spaceXViewModel.handedSpaceX.staticFireDateUtc;
    var newFormat = DateFormat("dd-MM-yy hh:mm:ss aaa");
    String missionFireDate = newFormat.format(fireDateUtc);
    return Text(
      "Static Fire Date: " + missionFireDate,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    );

    /*Text(
      "Last Update:" + TimeOfDay(hour: 20, minute: 34).format(context),
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    );*/
  }
}
