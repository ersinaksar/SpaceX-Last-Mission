import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex/viewmodels/spacex_view_model.dart';
import 'package:spacex/widget/last_mission.dart';
import 'package:spacex/widget/mission.dart';
import 'package:spacex/widget/mission_image.dart';
import 'package:spacex/widget/mission_information.dart';

class SpaceXApp extends StatelessWidget {
  String mission = "Mission is Mars";
  SpaceXViewModel _spaceXViewModel;
  @override
  Widget build(BuildContext context) {
    _spaceXViewModel = Provider.of<SpaceXViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Space X"),
        actions: [
          IconButton(
              icon: Icon(Icons.autorenew_outlined),
              onPressed: () async {
                _spaceXViewModel.takeSpaceX();
              }),
        ],
      ),
      body: Center(
        child: (_spaceXViewModel.state == SpaceXState.SpaceXLoadedState)
            ? SpaceXHandeled()
            : (_spaceXViewModel.state == SpaceXState.SpaceXLoadingState)
                ? SpaceXGetting()
                : (_spaceXViewModel.state == SpaceXState.SpaceXErrorState)
                    ? SpaceXError()
                    : Text("Press Refresh Button",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
      ),
    );
  }

  ListView SpaceXHandeled() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: MissionWidget(), //without parameter usage
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: LastMissionWidget()),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: MissionImageWidget()),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: MissionInformationWidget(
                  //with parameter usage
                  missionDetails: _spaceXViewModel.handedSpaceX.details)),
        ),
      ],
    );
  }

  SpaceXGetting() {
    return CircularProgressIndicator();
  }

  SpaceXError() {
    return Text("Error While SpaceX getting");
  }
}
