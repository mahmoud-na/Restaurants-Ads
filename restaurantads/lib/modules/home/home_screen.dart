import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantads/layout/home/cubit/cubit.dart';
import 'package:restaurantads/layout/home/cubit/states.dart';
import 'package:restaurantads/models/home_model.dart';
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
        var list = HomeCubit.get(context).homeModel;
        // print(list!.restaurants.length);
        return ConditionalBuilder(
          condition: state is! LoadingState,
          builder: (context) => Padding(
            padding: const EdgeInsets.only(top: 55.0),
            child: Column(
              children: [
                SizedBox(
                  height: 200.0,
                  width: 400.0,
                  child: defaultCarouselSlider(
                    list: list,
                    imageName: 'restaurantCoverImage',
                    logoName: 'restaurantLogoImage',
                    listLength: list!.restaurants.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Form(
                            key: formKey,
                            child: SizedBox(
                              height: 30.0,
                              child: defaultFormField(
                                textEditingController: searchController,
                                textInputType: TextInputType.text,
                                hintText: 'إبحث عن أكلك..',
                                prefixIcon: const Icon(Icons.search),
                                textStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                onChanged: (value) {},
                                onFieldSubmitted: (value) {
                                  if (formKey.currentState!.validate()) {
                                    print("I'm Searching ....");
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      dropDownMenu(),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 60.0,
                        child: defaultCategoryListView(categoryList: list),
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        height: 45.0,
                        child: defaultServicesListView(),
                      ),
                      const SizedBox(height: 10.0),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: defaultRestaurantCard(list: list),
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













  Widget defaultCategoryListView({
    required var categoryList,
  }) =>
      ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              CachedNetworkImage(
                key: UniqueKey(),
                imageUrl:
                    'https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?t=st=1653995035~exp=1653995635~hmac=61e0d2319fde904490c6f0fb36cc278f0b925c4721a69f7f792d707eae91a30a&w=2000',
                height: 44.0,
                width: 44.0,
                imageBuilder: (context, imageProvider) => Container(
                  width: 44.0,
                  height: 44.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Icon(
                    Icons.restaurant_menu,
                    color: Colors.red,
                    size: 30,
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
      );

  Widget defaultServicesListView() => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            children: [
              const SizedBox(width: 5.0),
              CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                radius: 15.0,
                child: CachedNetworkImage(
                  key: UniqueKey(),
                  imageUrl:
                      'https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?t=st=1653995035~exp=1653995635~hmac=61e0d2319fde904490c6f0fb36cc278f0b925c4721a69f7f792d707eae91a30a&w=2000',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    decoration: const BoxDecoration(
                        color: Colors.black12, shape: BoxShape.circle),
                  ),
                  errorWidget: (context, url, error) => Container(
                    decoration: const BoxDecoration(
                        color: Colors.black12, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.restaurant_menu,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              const Text("Hello"),
              const SizedBox(width: 10.0),
            ],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10.0),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      );

  Widget defaultRestaurantCard({
    required HomePageData list,
  }) =>
      ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side:
                  BorderSide(width: 0.5, color: Theme.of(context).primaryColor),
            ),
            child: Row(
              children: [
                CachedNetworkImage(
                  key: UniqueKey(),
                  imageUrl: list.restaurants[index].restaurantLogoImage!,
                  height: 60.0,
                  width: 60.0,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                      ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Icon(
                      Icons.restaurant_menu,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: SizedBox(
                    height: 60.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${list.restaurants[index].restaurantName}',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          child: Text(
                            list.restaurants[index].restaurantDescription!,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Column(
                  children: const [
                    Image(
                      image: AssetImage("assets/images/quality12.png"),
                      width: 23.0,
                      height: 23.0,
                      // color: Colors.amber,
                    ),
                    SizedBox(height: 5.0),
                    Icon(
                      Icons.favorite_outline,
                      color: Colors.red,
                      size: 23.0,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5.0,
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 10.0),
        itemCount: list.restaurants.length,
      );

  Widget dropDownMenu() => Row(
    children: [
      DropdownButtonHideUnderline(
        child: DropdownButton(
          items: const [
            DropdownMenuItem(
                child: Text("المميز"), value: "premium"),
            DropdownMenuItem(
                child: Text("الأسم"), value: "name"),
            DropdownMenuItem(
                child: Text("المفضلة"), value: "favorite"),
            DropdownMenuItem(
                child: Text("الأقرب"), value: "nearest"),
            DropdownMenuItem(
                child: Text("الأحدث"), value: "newest"),
          ],
          onChanged: (value) {
            print(value);
          },
          alignment: AlignmentDirectional.center,
          isDense: true,
          value: "name",
          borderRadius:
          const BorderRadius.all(Radius.circular(25)),
        ),
      ),
      const Text("رتب بــ "),
    ],
  );
}
