import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewIndicator extends StatelessWidget {
  const PageViewIndicator({
    Key? key,
    required this.isCurrentPage,
    this.marginEnd = 0,
  }) : super(key: key);

  final bool isCurrentPage;
  final double marginEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd,),
      height: 9.w,
      width: isCurrentPage?28.w:9.w,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xFFFF7750) : Color(0xFFCACACA),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
