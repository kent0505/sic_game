import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../core/utils.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final _connectivity = Connectivity();

  InternetBloc() : super(InternetInitial()) {
    on<CheckInternet>((event, emit) {
      _connectivity.onConnectivityChanged.listen((result) {
        logger('LISTENING CONNECTION...');
        if (result.contains(ConnectivityResult.mobile) ||
            result.contains(ConnectivityResult.wifi)) {
          logger('HAS INTERNET');
          add(ChangeInternet(connected: true));
        } else {
          logger('NO INTERNET');
          add(ChangeInternet(connected: false));
        }
      });
    });

    on<ChangeInternet>((event, emit) {
      event.connected ? emit(InternetSuccess()) : emit(InternetFailure());
    });
  }
}
