import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restaurantads/models/home_model.dart';
import 'package:restaurantads/shared/styles/colors.dart';

Widget myDivider() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget defaultFormField({
  required TextEditingController textEditingController,
  required TextInputType textInputType,
  required String hintText,
  required Widget prefixIcon,
  Function(String value)? onFieldSubmitted,
  Function(String value)? onChanged,
  TextStyle? textStyle,
}) =>
    TextFormField(
      controller: textEditingController,
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.grey,
        decoration: TextDecoration.none,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.zero,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: defaultColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: defaultColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: defaultColor,
          ),
        ),
      ),
    );

Widget defaultCarouselSlider({
  required HomePageData? list,
  required String imageName,
  required String logoName,
  required int listLength,
}) =>
    CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            CachedNetworkImage(
              key: UniqueKey(),
              imageUrl: list!.restaurants[index].restaurantCoverImage!,
              height: 150.0,
              width: 400.0,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
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
                decoration: const BoxDecoration(
                  color: Colors.black12,
                ),
                child: const Icon(
                  Icons.restaurant_menu,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: SizedBox(
                height: 60.0,
                width: 60.0,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  radius: 15.0,
                  child: CachedNetworkImage(
                    key: UniqueKey(),
                    imageUrl: list.restaurants[index].restaurantLogoImage!,
                    height: 50.0,
                    width: 50.0,
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
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.restaurant_menu,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      itemCount: list!.restaurants.length,
      options: CarouselOptions(
        scrollPhysics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        autoPlay: true,
        autoPlayCurve: Curves.easeInOut,
        autoPlayAnimationDuration: const Duration(milliseconds: 1300),
        autoPlayInterval: const Duration(seconds: 2),
        reverse: true,
      ),
    );
