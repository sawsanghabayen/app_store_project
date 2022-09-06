import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';

class CustomProduct extends StatelessWidget {
  EdgeInsets? margin = EdgeInsets.zero;
  final String image;
  VoidCallback onTap;
  final String text;

  CustomProduct({
    Key? key,
    this.margin,
    required this.image,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: 300.h,
        width: 152.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 180.h,
              width: 152.w,
              child: Stack(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Image.asset(image),
                  Center(
                      child: Image(
                    image: NetworkImage(image),
                  )),

                  Positioned(
                    top: 3.h,
                    right: 3.w,
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.all(8),
                        height: 28.h,
                        width: 28.w,
                        // child: Icon(Icons.shopping_cart_outlined, color: Color(0xffFF7750),),
                        child:
                            Icon(Icons.favorite_border, color: Color(0xffFF4848)),

                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 3.h,
                    left: 3.w,
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.all(8),
                        height: 28.h,
                        width: 28.w,
                        child: Icon(Icons.shopping_cart_outlined, color: Colors.black,),
                        // child: Icon(Icons.favorite_border, color: Color(0xffFF4848)),

                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Color(0xffDEDEE0),
                  borderRadius: BorderRadius.circular(20.r)),
            ),
            // SizedBox(
            //   height: 15.h,
            // ),
            AppText(
              text: text,
              fontSize: 13.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 20.h,
              child: AppText(
                text: '\$608',
                fontSize: 12.sp,
                color: Color(0xffFF7750),
                fontWeight: FontWeight.bold,
              ),
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
                        size: 20,
                      );
                    },
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                  ),
                  AppText(text: '(5.0)', fontSize: 12, color: Color(0xff3E3E3E))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
