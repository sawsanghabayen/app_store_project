import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/app_text.dart';
class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
          title: AppText(
            text: 'Order Details',
            fontSize: 20.sp,
            color: Color(0xFF3E3E3E),
            fontWeight: FontWeight.bold,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              flex: 2,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Container(
                      height: 100.h,
                      width: 325.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 80,
                                width: 79.97,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: Color(0xFFDEDEE0),
                                ),
                                child: Image(
                                  image: AssetImage('images/shoesImg.png'),
                                  width: 77.15,
                                  height: 54.13,
                                )),
                            SizedBox(
                              width: 12.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 6.5.h),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: 'Newbalance x Shoe Palace 997',
                                    fontSize: 14.sp,
                                    color: Color(0xFF3E3E3E),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  AppText(
                                    text: '2 Items',
                                    fontSize: 14.sp,
                                    color: Color(0xFFCACACA),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  AppText(
                                    text: '\$608',
                                    fontSize: 17.sp,
                                    color: Color(0xffFF7750),
                                    fontWeight: FontWeight.bold,
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 279.h,
                width: 325.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Color(0xFFFFFFFF),
                ),
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                  child: Column(children: [
                    Row(
                      children: [
                        AppText(
                            text: 'ID Order',
                            fontSize: 14.sp,
                            color: Color(0xFF3E3E3E)),
                        Spacer(),
                        AppText(
                            text: '#OD4886',
                            fontSize: 14.sp,
                            color: Color(0xFF3E3E3E)),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        AppText(
                            text: 'Date',
                            fontSize: 14.sp,
                            color: Color(0xFF3E3E3E)),
                        Spacer(),
                        AppText(
                            text: '28/8/2022,11:00PM',
                            fontSize: 14.sp,
                            color: Color(0xFF3E3E3E)),
                      ],
                    ),
                    // SizedBox(height: 20.h,),
                    Divider(
                      height: 40,
                      indent: 39.2,
                      endIndent: 39.2,
                    ),
                    Row(
                      children: [
                        AppText(
                          text: 'Total',
                          fontSize: 17.sp,
                          color: Color(0xFF3E3E3E),
                          fontWeight: FontWeight.bold,
                        ),
                        Spacer(),
                        AppText(
                            text: '\$556.29',
                            fontSize: 17.sp,
                            color: Color(0xFF3E3E3E),
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
            SizedBox(height: 50.h,),
          ],
        ),
      ),
    );

  }
}
