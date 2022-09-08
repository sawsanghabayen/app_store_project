import 'package:database_app/models/order_details.dart';
import 'package:database_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../getx/order_getx_controller.dart';
import 'order_details_screen.dart';
class OrdersScreen extends StatefulWidget {

   OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  OrderGetxController controller = Get.put(OrderGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(title: AppText(text: 'My Orders' , fontSize: 20.sp,
        color: Color(0xFF3E3E3E),
        fontWeight: FontWeight.bold,),),
      body: GetX<OrderGetxController>(builder: (controller) {
      return controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : controller.orders.isNotEmpty

          ?

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: ListView.builder(
          itemCount: controller.orders.length,
          itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.only(bottom: 16.h),
            child: InkWell(
              onTap: (){
                Get.to(()=>
                    OrderDetailsScreen(id:controller.orders[index].id!)
                );
              },
              child: Container(
                height: 100.h,
                width: 325.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Color(0xFFFFFFFF),
                ),
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
                      image: AssetImage('images/ride.png'),
                      width: 77.15,
                      height: 54.13,
                      fit:BoxFit.fill ,

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.5.h),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // AppText(
                        //   text: 'Order #',
                        //   fontSize: 14.sp,
                        //   color: Color(0xFF3E3E3E),
                        //   fontWeight: FontWeight.bold,
                        // ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text:
                              'Order # ',
                              style: GoogleFonts.nunito(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3E3E3E),

                                  ),
                              children: [
                                TextSpan(
                                  text: controller.orders[index].id.toString(),
                                  style: GoogleFonts.nunito(
                                      fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFCACACA),
                                     ),

                                ),

                              ]),
                        ),

                        SizedBox(
                          height: 3.h,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text:
                              'Payment: ',
                              style: GoogleFonts.nunito(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3E3E3E),

                              ),
                              children: [
                                TextSpan(
                                  text: controller.orders[index].paymentType,
                                  style: GoogleFonts.nunito(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFCACACA),
                                  ),

                                ),

                              ]),
                        ),

                        // AppText(
                        //   text: 'Cash',
                        //   fontSize: 14.sp,
                        //   color: Color(0xFFCACACA),
                        //   fontWeight: FontWeight.w400,
                        // ),
                        SizedBox(
                          height: 3.h,
                        ),
                        // AppText(
                        //   text: 'Status: ',
                        //   fontSize: 14.sp,
                        //   color: Color(0xFF3E3E3E),
                        //   fontWeight: FontWeight.bold,
                        // ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text:
                              'Status: ',
                              style: GoogleFonts.nunito(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3E3E3E),

                              ),
                              children: [
                                TextSpan(
                                  text:controller.orders[index].status,
                                  style: GoogleFonts.nunito(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFCACACA),
                                  ),

                                ),

                              ]),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        AppText(
                          text: controller.orders[index].date!,
                          fontSize: 14.sp,
                          color: Color(0xFFCACACA),
                          fontWeight: FontWeight.w400,
                        ),
                        // AppText(
                        //   text: '\$608',
                        //   fontSize: 17.sp,
                        //   color: Color(0xffFF7750),
                        //   fontWeight: FontWeight.bold,
                        // ),


                      ],
                    ),
                  ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                            // AppText(
                            //   text: '550',
                            //   fontSize: 14.sp,
                            //   color: Color(0xFF3E3E3E),
                            //   fontWeight: FontWeight.bold,
                            // ),
                              AppText(
                                text: controller.orders[index].total.toString(),
                                fontSize: 17.sp,
                                color: Color(0xffFF7750),
                                fontWeight: FontWeight.bold,
                              ),
                            SizedBox(
                              height: 3.h,
                            ),
                            AppText(
                              text: '\$',
                              fontSize: 17.sp,
                              color: Color(0xffFF7750),
                              fontWeight: FontWeight.bold,
                            ),

                          ],),
                          SizedBox(width: 5.w,),
                          InkWell(child: Icon(Icons.keyboard_arrow_right),
                          onTap:(){
                            Navigator.pushNamed(context, '/order_details_screen');
                          }),
                        ],

                      ),
                ]),

              ),
            ),
          );
        },),
      ):
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'images/noItemInCart.png',
            ),
            SizedBox(
              height: 15.h,
            ),
            AppText(
                text: 'No Orders!',
                fontSize: 18.sp,
                color: Colors.grey.shade400),
          ],
        ),
      );

      }),
    );
  }
}

