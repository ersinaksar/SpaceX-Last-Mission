import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spacex/sign_in_page.dart';
import 'package:spacex/theme_cubit.dart';
import 'package:spacex/viewmodels/spacex_view_model.dart';
import 'package:spacex/widget/last_mission.dart';
import 'package:spacex/widget/mission.dart';
import 'package:spacex/widget/mission_image.dart';
import 'package:spacex/widget/mission_information.dart';

//event ya d bloüu kullandığımızda neler olacğına dair bilgi veriyor
/// Custom [BlocObserver] which observes all bloc and cubit instances.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

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
                    : SignInPage(), /*Text(
                        "Press Refresh Button",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),*/
      ),
      floatingActionButton: MyActions(),
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

class MyActions extends StatelessWidget {
  const MyActions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: "3",
          onPressed: () {
            context.read<ThemeCubit>().temaDegistir();
          },
          child: Icon(Icons.brightness_6),
          tooltip: "Tema DEğiştir",
        ),
      ],
    );
  }
}
