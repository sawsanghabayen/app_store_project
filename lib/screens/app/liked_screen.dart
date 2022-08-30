import 'package:database_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({Key? key}) : super(key: key);

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: ListView.builder(
          itemCount: 10,
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                      Padding(
                        padding: EdgeInsets.only(top: 6.5.h),
                        child: Column(
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
                              text: 'Brieze Store',
                              fontSize: 14.sp,
                              color: Color(0xFFCACACA),
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: '\$608',
                                  fontSize: 17.sp,
                                  color: Color(0xffFF7750),
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(width: 150.w,),
                                Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    height: 28.h,
                                    width: 28.w,
                                    child: Icon(Icons.favorite,color: Colors.red,)),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // Stack(
              //   children: [
              //     Container(
              //       height: 100.h,
              //       width: 325.w,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20.r),
              //         color: Color(0xFFFFFFFF),
              //       ),
              //       child: Padding(
              //         padding: EdgeInsets.symmetric(
              //             horizontal: 10.w, vertical: 10.h),
              //         child: Row(
              //           children: [
              //             Container(
              //                 height: 80,
              //                 width: 79.97,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(15.r),
              //                   color: Color(0xFFDEDEE0),
              //                 ),
              //                 child: Image(
              //                   image: AssetImage('images/shoesImg.png'),
              //                   width: 77.15,
              //                   height: 54.13,
              //                 )),
              //             SizedBox(
              //               width: 19.8.w,
              //             ),
              //             Padding(
              //               padding: EdgeInsets.only(top: 6.5.h),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   AppText(
              //                     text: 'Newbalance x Shoe Palace 997',
              //                     fontSize: 14.sp,
              //                     color: Color(0xFF3E3E3E),
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                   SizedBox(
              //                     height: 3.h,
              //                   ),
              //                   AppText(
              //                     text: 'Brieze Store',
              //                     fontSize: 14.sp,
              //                     color: Color(0xFFCACACA),
              //                     fontWeight: FontWeight.w400,
              //                   ),
              //                   SizedBox(
              //                     height: 3.h,
              //                   ),
              //                   AppText(
              //                     text: '\$608',
              //                     fontSize: 17.sp,
              //                     color: Color(0xffFF7750),
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //     Positioned(
              //       bottom: 16.5.h,
              //       right: 10.w,
              //       child: Container(
              //         // decoration: BoxDecoration(shape: BoxShape.circle),
              //         decoration: const BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: Color(0xFFFAFAFA),
              //         ),
              //
              //         height: 28.h,
              //         width: 28.w,
              //         child: Icon(Icons.favorite_border)
              //       ),
              //     )
              //   ],
              // ),
            );

            // return ListTile(
            //    // style: ,
            //   leading: Container(
            //     height: 80,
            //     width: 79.97,
            //     decoration:
            //         BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
            //     child: Image(
            //       image: AssetImage('images/shirt.png'),
            //       width: 77.15,
            //       height: 54.13,
            //     ),
            //     // Images.asset('images/shirt.png' ,)
            //     alignment: AlignmentDirectional.center,
            //   ),
            //   title: Column(children: [
            //     AppText(
            //       text: 'text',
            //       fontSize: 14.sp,
            //       color: Color(0xFF3E3E3E),
            //       fontWeight: FontWeight.bold,
            //     )
            //   ]),
            // );
          },
        ),
      ),
    );
  }
}
