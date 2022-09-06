import 'package:database_app/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/app_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: '2 '+ context.localizations.cart_count_items,
              fontSize: 14.sp,
              color: Color(0xFF3E3E3E),
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              flex: 1,
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
                                    text: 'Brieze Store',
                                    fontSize: 14.sp,
                                    color: Color(0xFFCACACA),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Container(
                                    // color: Colors.red,
                                    width: 215.w,
                                    height: 29.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                          text: '\$608',
                                          fontSize: 17.sp,
                                          color: Color(0xffFF7750),
                                          fontWeight: FontWeight.bold,
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFFFAFAFA),
                                                  ),
                                                  height: 30.h,
                                                  width: 30.w,
                                                  child: Align(
                                                    alignment: Alignment.topCenter,
                                                    child: Icon(
                                                      Icons.minimize,
                                                      color: Color(0xFF8992A3),
                                                    ),
                                                  )),
                                              SizedBox(width: 10.5.w),
                                              AppText(
                                                  text: '1',
                                                  fontSize: 17.sp,
                                                  color: Color(0xFFF3651F)),
                                              SizedBox(width: 10.5.w),
                                              Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFFFAFAFA),
                                                  ),
                                                  height: 30.h,
                                                  width: 30.w,
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Color(0xFF8992A3),
                                                    ),
                                                  ),),
                                            ],
                                          ),
                                        )

                                      ],
                                    ),
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
                            text: context.localizations.cart_sub_total,
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
                          text: context.localizations.cart_total,
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
                            minimumSize: Size(325.w, 63.83.h),
                            primary: Color(0xffFF7750),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r))),
                        child: Text(
                         context.localizations.cart_submit,
                          style: GoogleFonts.nunito(
                              fontSize: 16.sp,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.bold),
                        )),
                  ]),
                ),
              ),
            ),
            SizedBox(height: 15.h),

          ],
        ),
      ),
    );
  }
}
