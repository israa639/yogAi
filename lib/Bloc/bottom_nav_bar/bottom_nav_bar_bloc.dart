import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/models/pose.dart';
import '../../data/repositories/poses_repository.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  int current_index=0;

final  poses_repository posesRepository;


    BottomNavBarBloc({required this.posesRepository}) : super(PageLoading()) {

    on<AppStarted>((event, emit) async{
try{

  await this.posesRepository.getPoses();
  //List<Pose>? poses=this.posesRepository.poses;

}
  catch(e){
  print(e.toString());
  }
      emit(PageLoading());
      try {
        emit(HomePageLoaded());
      }
      catch(e){
        emit(PageLoadedError(e.toString()));
      }
    });
    on<PageTapped>((event, emit) async {
      this.current_index=event.index;
      emit(PageLoading());
      if(this.current_index%3==0)
      {try {
        emit(HomePageLoaded());
      }
      catch(e){
        emit(PageLoadedError(e.toString()));
      }}
      if(this.current_index%3==1)
      {
        try {
        emit(PosesPageLoaded(this.posesRepository.poses));
      }
      catch(e){
        emit(PageLoadedError(e.toString()));
      }}

      if(this.current_index%3==2)
      {try {
        emit(ProfilePageLoaded());
      }
      catch(e){
        emit(PageLoadedError(e.toString()));
      }}
    });
  }
  @override
  void onTransition(Transition<BottomNavBarEvent, BottomNavBarState> transition) {
    print(transition);
    super.onTransition(transition);
  }
}
