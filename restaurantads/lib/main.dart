import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantads/layout/home/cubit/cubit.dart';
import 'package:restaurantads/shared/bloc_observer.dart';
import 'package:restaurantads/shared/cubit/cubit.dart';
import 'package:restaurantads/shared/cubit/states.dart';
import 'package:restaurantads/shared/network/remote/dio_helper.dart';

import 'layout/home/home_layout.dart';
import 'modules/loading/loading_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(
    const MyApp(
      startingScreen: HomeLayout(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget? startingScreen;

  const MyApp({
    Key? key,
    this.startingScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider<HomeCubit>(
          /*
          *  By default, blocs are created lazily by BlocProvider which means create will not be called until the
          *  bloc is looked up via BlocProvider.of(context).
          *  You can set lazy to false on BlocProvider to force
          *  the blocs to be created immediately.
          * */
          // lazy: false,
          create: (context) {
            return HomeCubit();
          },
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: const Color(0xfffafafa),
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.deepOrange,
                  statusBarIconBrightness: Brightness.dark,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Color(0xfffafafa),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                elevation: 0.0,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 30.0,
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
            ),
            title: "Restaurant-Ads",
            home: Directionality(
              child: startingScreen!,
              textDirection: TextDirection.ltr,
            ),
          );
        },
      ),
    );
  }
}
