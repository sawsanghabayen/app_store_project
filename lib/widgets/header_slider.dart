import 'dart:async';

import 'package:database_app/screens/widgets/page_view_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderPage extends StatefulWidget {
  HeaderPage({Key? key}) : super(key: key);

  @override
  State<HeaderPage> createState() => _HeaderPageState();
}

class _HeaderPageState extends State<HeaderPage> {
  int length = 0;
  late int currentPage = 0;
  late Timer _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds:5), (Timer timer) {
      if (currentPage < 2) {
        setState(() {
          currentPage++;
        });
      } else {
        setState(() {
          currentPage = 0;
        });
      }

      _pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,

      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
          clipBehavior: Clip.antiAlias,
          height: 150.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index){
              currentPage=index;
              setState((){});
            },
            itemBuilder: (context, index) {

              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/slider.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
            itemCount: 3,
          ),
        ),
        Positioned(
          bottom: 5.h,
          left: 5.w,
          right:  5.w,
          child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: SizedBox(
              // color: Colors.red,
              width: 100.w,
              height: 10.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PageViewIndicator(isCurrentPage: currentPage == index ,marginEnd: 15,);
                  // return Padding(
                  //   padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
                  //   child: Container(
                  //     height: 100,
                  //     width: 7,
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: currentPage == index ? Colors.orange : Colors.grey,
                  //     ),
                  //   ),
                  // );
                },
                itemCount: 3,

              ),
            ),
          ),
        )
      ],
    );
  }
}