import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/Rounds_model.dart';
import '../../data/models/user.dart';
import '../../data/repositories/rounds_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final user current_user;
  int current_index=0;

  List<Round>?Focused_area_rounds;
  roundsRepository round_repository;
  HomeBloc({required this.current_user,required this.round_repository}) : super(HomeInitial()) {
  on<FirstInitiate>((event, emit) {
    try {
     this.round_repository.get_program_Rounds();
     Focused_area_rounds=this.round_repository.program_focused_area_rounds;
     emit(HomeInitial());
   }
   catch(e)
    {
      emit(Page_LoadedError(e.toString()));
    }});
    on<FocusedAreaRoundTap>((event, emit) {
       current_index=event.Taped_index;
       emit(LoadedPage(Focused_area_rounds![current_index]));


    });
  }@override
  void onTransition(Transition<HomeEvent, HomeState> transition) {
    print(transition);
    super.onTransition(transition);
  }
}
