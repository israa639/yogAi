import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/user.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final user current_user;
  HomeBloc({required this.current_user}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {

    });
  }
}
