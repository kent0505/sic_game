import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<ChangePage>((event, emit) {
      if (event.index == 1) emit(HomeInitial());
      if (event.index == 2) emit(HomeRules());
      if (event.index == 3) emit(HomeSettings());
    });
  }
}
