
part of 'hbloc.dart';

//States for bloc to respond to client query

abstract class HomeState{}

abstract class HomeActionState extends HomeState{}

class HomeInitial extends HomeState{
}


class HomeLoadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({
    required this.products,
  });
}

class HomeErrorState extends HomeState{}
class HomeNavigateToPageActionState extends HomeActionState{}
