import 'dart:async';

import 'package:blocconnectivity/Bloc/internet_event.dart';
import 'package:blocconnectivity/Bloc/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity/connectivity.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? connectivitySubscription;
  Connectivity _connectivity = Connectivity();

  InternetBloc() : super(InternetInitialState()) {
    on<InternetLostEvent>((event, emit) => InternetLostState());
    on<InternetGainedEvent>((event, emit) => InternetGainedState());
    connectivitySubscription=_connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();

    return super.close();
  }
}
