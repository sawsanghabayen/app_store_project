import 'package:database_app/models/process_response.dart';
import 'package:database_app/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../getx/cart_getx_controller.dart';
import '../../../getx/product_getx_controller.dart';
import '../../../widgets/app_text.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  CartGetxController controller = Get.put(CartGetxController());
  ProductGetxController productGetxController =
      Get.put(ProductGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: GetX<CartGetxController>(builder: (controller) {
        // if (controller.loading.isTrue) {
        return controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : controller.cartItems.value.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // IconButton(  padding: EdgeInsets.zero,onPressed: (){}, icon:Icon( Icons.delete),),

                            AppText(
                              text:
                                  controller.cartItems.value.length.toString() +
                                      ' ' +
                                      context.localizations.cart_count_items,
                              fontSize: 14.sp,
                              color: Color(0xFF3E3E3E),
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.cartItems.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key: UniqueKey(),
                                onDismissed: (direction) async {
                                  ProcessResponse process =
                                      await controller.deleteItem(index);
                                  context.showSnackBar(
                                      message: process.message,
                                      error: !process.success);
                                },
                                background: Container(color: Colors.red),
                                child: Padding(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              height: 80,
                                              width: 79.97,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
                                                color: Color(0xFFDEDEE0),
                                              ),
                                              child: Image(
                                                image: NetworkImage(
                                                  controller .cartItems[index].productImage,
                                           ),
                                                width: 77.15,
                                                height: 54.13,
                                              )),


                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(top: 6.5.h),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AppText(
                                                  text: controller
                                                      .cartItems[index]
                                                      .productName,
                                                  // controller.productGetxController.getProductDetails(id:controller.cartItems[index].productId).then((value) => va),
                                                  fontSize: 14.sp,
                                                  color: Color(0xFF3E3E3E),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                SizedBox(
                                                  height: 3.h,
                                                ),
                                                Container(
                                                  width: 215.w,
                                                  height: 29.h,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      AppText(
                                                        text:
                                                            '\$${controller.cartItems[index].price}',
                                                        fontSize: 17.sp,
                                                        color:
                                                            Color(0xffFF7750),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            InkWell(
                                                              child: Container(
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Color(
                                                                        0xFFFAFAFA),
                                                                  ),
                                                                  height: 30.h,
                                                                  width: 30.w,
                                                                  child: Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topCenter,
                                                                    child: Icon(
                                                                      Icons
                                                                          .minimize,
                                                                      color: Color(
                                                                          0xFF8992A3),
                                                                    ),
                                                                  )),
                                                              onTap: () {
                                                                controller.changeQuantity(
                                                                    index,
                                                                    controller
                                                                            .cartItems[index]
                                                                            .count -
                                                                        1);
                                                              },
                                                            ),
                                                            SizedBox(
                                                                width: 10.5.w),
                                                            AppText(
                                                                text: controller
                                                                    .cartItems[
                                                                        index]
                                                                    .count
                                                                    .toString(),
                                                                fontSize: 17.sp,
                                                                color: Color(
                                                                    0xFFF3651F)),
                                                            SizedBox(
                                                                width: 10.5.w),
                                                            Container(
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Color(
                                                                    0xFFFAFAFA),
                                                              ),
                                                              height: 30.h,
                                                              width: 30.w,
                                                              child: Center(
                                                                child:
                                                                    IconButton(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  onPressed:
                                                                      () {
                                                                    controller.changeQuantity(
                                                                        index,
                                                                        controller.cartItems[index].count +
                                                                            1);
                                                                  },
                                                                  icon: Icon(
                                                                      Icons
                                                                          .add),
                                                                  color: Color(
                                                                      0xFF8992A3),
                                                                ),
                                                              ),
                                                            ),
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.h, horizontal: 15.w),
                              child: Column(children: [
                                Row(
                                  children: [
                                    AppText(
                                        text: context
                                            .localizations.cart_sub_total,
                                        fontSize: 14.sp,
                                        color: Color(0xFF3E3E3E)),
                                    Spacer(),
                                    AppText(
                                        text:
                                            '\$${controller.getTotla().toString()}',
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
                                        text: '\$0',
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
                                        text:
                                            '\$${controller.getTotla().toString()}',
                                        fontSize: 17.sp,
                                        color: Color(0xFF3E3E3E),
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                                Spacer(),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/check_out_screen');
                                    },
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size(325.w, 63.83.h),
                                        primary: Color(0xffFF7750),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.r))),
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
                  )
                : Center(
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
                            text: 'Please go shopping',
                            fontSize: 18.sp,
                            color: Colors.grey.shade400),
                      ],
                    ),
                  );
      }),
    );
  }
}
