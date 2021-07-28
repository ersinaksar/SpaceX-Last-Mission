import 'package:flutter/material.dart';
import 'package:spacex/data/spacex_repository.dart';
import 'package:spacex/locator.dart';
import 'package:spacex/models/spacex.dart';

enum SpaceXState {
  InitialSpaceXState,
  SpaceXLoadingState,
  SpaceXLoadedState,
  SpaceXErrorState
}

class SpaceXViewModel with ChangeNotifier {
  SpaceXState _state;
  SpaceXRepository _repository = locator<SpaceXRepository>();
  SpaceX _handedSpaceX;

  SpaceX get handedSpaceX => _handedSpaceX;

  SpaceXViewModel() {
    _handedSpaceX = SpaceX();
    _state = SpaceXState.InitialSpaceXState;
  }

  SpaceXState get state => _state;

  set state(SpaceXState value) {
    _state = value;
    notifyListeners();
  }

  Future<SpaceX> takeSpaceX() async {
    try {
      state = SpaceXState.SpaceXLoadingState;
      _handedSpaceX = await _repository.getSpaceX();
      state = SpaceXState.SpaceXLoadedState;
    } catch (e) {
      state = SpaceXState.SpaceXErrorState;
    }
    return _handedSpaceX;
  }
}
