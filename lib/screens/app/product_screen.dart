import 'dart:async';

import 'package:database_app/screens/widgets/page_view_indicator.dart';
import 'package:database_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index){
                    currentPage=index;
                    setState((){});
                  },
                  itemBuilder: (context, index) {

                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/shirt.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  itemCount: 3,
                ),
                Positioned(
                  // bottom:  15.h,
                  left: 10.w,
                  right:  10.w,
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: SizedBox(
                      height: 10.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return  PageViewIndicator(isCurrentPage: currentPage == index,marginEnd: 15.w,);
                        },
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(25),
            //   topRight: Radius.circular(25),
            // )),
            // width: 375.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    width: 325.w,
                    height: 50.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                                text: 'Jacket Pullover Sweat Hoodie',
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              height: 5.h,
                            ),
                            AppText(
                              text: '\$608',
                              fontSize: 17.sp,
                              color: Color(0xffFF7750),
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                  AppText(
                    text:
                        'lorem loremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem',
                    fontSize: 16.sp,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  SizedBox(
                    height: 20.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 35,
                            );
                          },
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                        ),
                        AppText(
                            text: '(5.0)',
                            fontSize: 12,
                            color: Color(0xff3E3E3E))
                      ],
                    ),
                  ),
                  Spacer(flex: 3),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(325.w, 63.83.h),
                        primary: Color(0xffFF7750),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r))),
                    child: AppText(
                        text: 'Add To Chart',
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
