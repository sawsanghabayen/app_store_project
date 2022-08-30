import 'package:database_app/widgets/app_text.dart';
import 'package:database_app/widgets/icon_with_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Checkout', fontSize: 20.sp, color: Colors.black,fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        elevation: 2.5,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            Expanded(flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  _buildType(name: 'Address', onPress: () {}, text: 'Change'),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(11),
                    margin: EdgeInsets.only(bottom: 20.h),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                  text: 'Home',
                                  fontSize: 13.sp,
                                  color: Color(0xFF8992A3)),

                            ],
                          ),
                          IconWithText(
                              text: '680 Mowe Court, New York, US',
                              icon: Icon(Icons.location_pin)),
                          IconWithText(
                              text: 'Sophia Benson', icon: Icon(Icons.person)),
                          IconWithText(
                              text: '+1(368)68 000 068', icon: Icon(Icons.call)),
                        ]),
                    height: 144.h,
                    width: 343.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(0, 10),
                            blurRadius: 5)
                      ],
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  _buildType(name: 'Payment', onPress: () {}, text: 'Change'),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 90.h,
                    // width: ,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(

                        children: [
                          Icon(
                            Icons.paypal,
                            color: Colors.blue,
                            size: 35,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          AppText(
                              text: '***** ****** ****** 45125',
                              fontSize: 12.sp,
                              color: Colors.grey),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(0, 10),
                            blurRadius: 5)
                      ],
                      color: Colors.white,
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 279.h,
                width: 325.w,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          offset: Offset(10, 10),
                          blurRadius: 5)
                    ],
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
                            text: 'Subtotal',
                            fontSize: 14.sp,
                            color: Color(0xFF3E3E3E)),
                        Spacer(),
                        AppText(
                            text: '\$553',
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
                            text: 'Tax',
                            fontSize: 14.sp,
                            color: Color(0xFF3E3E3E)),
                        Spacer(),
                        AppText(
                            text: '\$3.29',
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
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/check_out_screen');
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(315.w, 58.83.h),
                            primary: Color(0xffFF7750),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r))),
                        child: Text(
                          'Confirm Order',
                          style: GoogleFonts.nunito(
                              fontSize: 16.sp,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.bold),
                        )),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildType(
      {required String name,
      required VoidCallback onPress,
      required String text}) {
    return Container(
      width: 325.w,
      height: 33.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: name,
            fontSize: 17.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          TextButton(
            onPressed: onPress,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
