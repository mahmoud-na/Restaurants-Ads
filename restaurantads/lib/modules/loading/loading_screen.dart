import 'package:flutter/material.dart';
import 'package:restaurantads/shared/network/remote/dio_helper.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DioHelper.getData(
            url: 'api/restaurants/v1/',
            query: {}
          ).then((value) {
            print(value.data.toString());
          }).catchError((err) {
            print(err.toString());
          });
        },
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   stops: [
            //     0.3,
            //     0.9,
            //   ],
            //   colors: [
            //     Color(0xFFFFEB3B),
            //     Color(0xFFF44336),
            //   ],
            // ),
          ),
          child: const Center(
            child: Text("Helloooooooooooooooooooooooooo"),
          ),
        ),
      ),
    );
  }
}
