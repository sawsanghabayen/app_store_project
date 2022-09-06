import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';

class CustomCategory extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  final String title;

   EdgeInsets? margin =EdgeInsets.zero;

   CustomCategory({
    Key? key,
    required this.height,
    required this.width,
    required this.image,
    required this.title,
     this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      // margin: EdgeInsets.only(right: 20.w),
      // height: 80.h,
      // width: 235.w,
      height: height,
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        child: AppText(
            text: title,
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
