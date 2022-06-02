abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeBottomNavState extends HomeStates {}

class LoadingState extends HomeStates {}

class GetHomeDataSuccessState extends HomeStates {}

class GetHomeDataErrorState extends HomeStates {
  final String error;
  GetHomeDataErrorState(this.error);
}
