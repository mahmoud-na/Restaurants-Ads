import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantads/layout/home/cubit/cubit.dart';
import 'package:restaurantads/layout/home/cubit/states.dart';
import 'package:restaurantads/shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = HomeCubit.get(context).homeData;
        print(list.length);
        return ConditionalBuilder(
          condition: state is! LoadingState,
          builder: (context) => Padding(
            padding: const EdgeInsets.only(top: 55.0),
            child: Column(
              children: [
                SizedBox(
                  height: 200.0,
                  width: 400.0,
                  child: PageView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Container(
                          height: 150.0,
                          width: 400.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?t=st=1653995035~exp=1653995635~hmac=61e0d2319fde904490c6f0fb36cc278f0b925c4721a69f7f792d707eae91a30a&w=2000',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                          Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: SizedBox(
                              height: 60.0,
                              width: 60.0,
                              child: CircleAvatar(
                                backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                                radius: 15.0,
                                child: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?t=st=1653995035~exp=1653995635~hmac=61e0d2319fde904490c6f0fb36cc278f0b925c4721a69f7f792d707eae91a30a&w=2000',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                    itemCount: 5,
                    physics: const BouncingScrollPhysics(),
                    reverse: true,
                    onPageChanged: (index) {
                    },
                    // controller: cubit.boardingController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Form(
                            key: formKey,
                            child: SizedBox(
                              height: 30.0,
                              child: TextFormField(
                                controller: searchController,
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
                                onFieldSubmitted: (value) {
                                  if (formKey.currentState!.validate()) {
                                    print("I'm Searching ....");
                                  }
                                },
                                onChanged: (value) {
                                  print("We have Change Here");
                                },
                                style: const TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.none,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'إبحث عن أكلك..',
                                  contentPadding: EdgeInsets.zero,
                                  prefixIcon: const Icon(Icons.search),
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      GestureDetector(
                          onTap: () {
                            print("Hahahahahahha");
                          },
                          child: const Text("رتب بـ الاسم")),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0,),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 60.0,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 44.0,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                        'https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?t=st=1653995035~exp=1653995635~hmac=61e0d2319fde904490c6f0fb36cc278f0b925c4721a69f7f792d707eae91a30a&w=2000',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Text("Hellooo"),
                              ],
                            ),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 5.0,
                          ),
                          itemCount: 10,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 45.0,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5.0,
                                ),
                                CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  radius: 15.0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?t=st=1653995035~exp=1653995635~hmac=61e0d2319fde904490c6f0fb36cc278f0b925c4721a69f7f792d707eae91a30a&w=2000',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                const Text("Hello"),
                                const SizedBox(
                                  width: 10.0,
                                ),
                              ],
                            ),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10.0,
                          ),
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(
                                      width: 0.5,
                                      color: Theme.of(context).primaryColor),),
                              child: Row(
                                children: [
                                  Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?t=st=1653995035~exp=1653995635~hmac=61e0d2319fde904490c6f0fb36cc278f0b925c4721a69f7f792d707eae91a30a&w=2000',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 60.0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${list[index]['restaurantName']}',
                                              style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const Text(
                                            '14:11:05',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10.0,
                          ),
                          itemCount: list.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
