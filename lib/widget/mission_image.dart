import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex/viewmodels/spacex_view_model.dart';

class MissionImageWidget extends StatelessWidget {
  const MissionImageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _spaceXViewModel = Provider.of<SpaceXViewModel>(context);
    var patchLink = _spaceXViewModel.handedSpaceX.links.patch.small;
    return Column(
      children: [
        Image.network(
          patchLink,
          width: 200,
          height: 200,
        )
      ],
    );
  }
}
