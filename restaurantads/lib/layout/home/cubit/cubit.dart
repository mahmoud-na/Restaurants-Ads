import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantads/layout/home/cubit/states.dart';
import 'package:restaurantads/models/home_model.dart';
import 'package:restaurantads/modules/home/home_screen.dart';
import 'package:restaurantads/modules/news/news_screen.dart';
import 'package:restaurantads/modules/offers/offers_screen.dart';
import 'package:restaurantads/modules/settings/settings_screen.dart';
import 'package:restaurantads/shared/network/remote/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screensList = [
    HomeScreen(),
    const OfferScreen(),
    const NewsScreen(),
    const SettingsScreen(),
  ];

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.local_offer),
      label: 'Offers',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.new_label),
      label: 'News',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  List<dynamic> homeData = [];

  HomePageData? homeModel;

  void getHomeData() {
    emit(LoadingState());
    DioHelper.getData(url: "api/restaurants/v1/").then((value) {
      homeModel = HomePageData.fromJson(value.data);
      print(homeModel!.restaurants.length);
      // homeData = value.data;
      // print(value.data);
      // print(homeData.length);
      emit(GetHomeDataSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetHomeDataErrorState(onError.toString()));
    });
  }

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(HomeBottomNavState());
  }
}
