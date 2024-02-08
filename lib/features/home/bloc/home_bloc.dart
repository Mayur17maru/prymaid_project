

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pyramid/data/exercise_options.dart';

import '../model/home_product_data.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductClickedNavigateEvent>(homeProductClickedNavigateEvent);
  }
  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async{  //Initial bloc loaded on app launch

    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(products: ExerciseOptions.exerciseProducts.map((e) => ProductDataModel(
        id: e['id'],
        name: e['name'],
        time: e['time'],
        level: e['level'],
        imageUrl: e['imageUrl'])).toList()));
  }
  FutureOr<void> homeProductClickedNavigateEvent(HomeProductClickedNavigateEvent event, Emitter<HomeState> emit) {  //when product is clicked this event is triggered and homenavigatestate is emmitted
    print("Product Clicked");
    emit(HomeNavigateToPageActionState());
  }
}