import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:database_app/api/controllers/users_api_controller.dart';
import 'package:database_app/models/home.dart';
import 'package:database_app/models/image_slider.dart';
import 'package:database_app/screens/widgets/page_view_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderPage extends StatefulWidget {
  final List<MySlider> images;

  HeaderPage({Key? key, required this.images}) : super(key: key);

  @override
  State<HeaderPage> createState() => _HeaderPageState();
}

class _HeaderPageState extends State<HeaderPage> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400.h,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: widget.images.map((MySlider slider) {
          return Builder(
            builder: (BuildContext context) {
              return CachedNetworkImage(
                height: 400.h,
                width: double.infinity,
                imageUrl: slider.imageUrl,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              );
            },
          );
        }).toList(),
      ),
    );
  }


}
