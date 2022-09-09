import 'dart:convert';

import 'package:database_app/getx/address_getx_controller.dart';
import 'package:database_app/getx/cart_getx_controller.dart';
import 'package:database_app/getx/order_getx_controller.dart';
import 'package:database_app/models/address.dart';
import 'package:database_app/models/process_response.dart';
import 'package:database_app/screens/app/addresses_screen.dart';
import 'package:database_app/screens/app/home_screen.dart';
import 'package:database_app/utils/context_extension.dart';
import 'package:database_app/widgets/app_text.dart';
import 'package:database_app/widgets/icon_with_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  CartGetxController cartGetxController =
      Get.put<CartGetxController>(CartGetxController());

  OrderGetxController orderGetxController =
      Get.put<OrderGetxController>(OrderGetxController());

  AddressGetxController addressGetxController =
      Get.put<AddressGetxController>(AddressGetxController());

  List<Address> list = [];

  late Address address;

  @override
  void initState() {
    // TODO: implement initState
    addressGetxController.getAddresses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
            text: 'Checkout',
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        elevation: 2.5,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildType(
                      name: 'Address',
                      onPress: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AddressesScreen();
                            },
                          ),
                        );
                      },
                      text: 'Change'),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 150.h,
                    child: GetBuilder<AddressGetxController>(
                      builder: (controller) {
                        if (controller.addressRx.value.name == null) {
                          List<Address> address = controller.addresses.value;

                          /**
                           *  list.firstWhere((element) => element.contains(''),
                              orElse: () => 'No matching color found');
                           */
                          return controller.loading.value
                              ? CircularProgressIndicator()
                              : Container(
                                  padding: EdgeInsets.all(11),
                                  margin: EdgeInsets.only(bottom: 20.h),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AppText(
                                                text: address[0].name!,
                                                fontSize: 13.sp,
                                                color: Color(0xFF8992A3)),
                                          ],
                                        ),
                                        IconWithText(
                                            text: address[0].city!.nameEn!,
                                            icon: Icon(Icons.location_city)),
                                        IconWithText(
                                            text: address[0].info!,
                                            icon: Icon(Icons.location_pin)),
                                        IconWithText(
                                            text: address[0].contactNumber!,
                                            icon: Icon(Icons.call)),
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
                                );
                        } else {
                          return Container(
                            padding: EdgeInsets.all(11),
                            margin: EdgeInsets.only(bottom: 20.h),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                          text: controller
                                              .selectedAddress()
                                              .name!,
                                          fontSize: 13.sp,
                                          color: Color(0xFF8992A3)),
                                    ],
                                  ),
                                  IconWithText(
                                      text: controller
                                          .selectedAddress()
                                          .city!
                                          .nameEn!,
                                      icon: Icon(Icons.location_city)),
                                  IconWithText(
                                      text: controller.selectedAddress().info!,
                                      icon: Icon(Icons.location_pin)),
                                  IconWithText(
                                      text: controller
                                          .selectedAddress()
                                          .contactNumber!,
                                      icon: Icon(Icons.call)),
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
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  _buildType(
                      name: 'Payment',
                      onPress: () {
                        print(list);
                      },
                      text: 'Change'),
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
                            text: '\$${cartGetxController.getTotla()}',
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
                            text: '\$0.0',
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
                            text: '\$${cartGetxController.getTotla()}',
                            fontSize: 17.sp,
                            color: Color(0xFF3E3E3E),
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () async {
                          int id = addressGetxController.addressRx.value.name ==
                                  null
                              ? addressGetxController.addresses.value.first.id!
                              : addressGetxController.addressRx.value.id!;
                          ProcessResponse process=await OrderGetxController.to.create(
                              CartGetxController.to.cartItems.value,
                              'Cash',
                              id);
                          _showSuccessConfirmOrder(text:process.message,);
                          // context.showSnackBar(message: process.message,error: !process.success);

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

  void _showSuccessConfirmOrder({required String text}) async {
   await showDialog<bool>(
        barrierDismissible: false,
        barrierColor: Color(0xFF3E3E3E).withOpacity(0.8),
        context: context,
        builder: (context) {
          return ShowSuccess(text: text);
        });

  }

}
class ShowSuccess extends StatelessWidget {
  CartGetxController controller=Get.put<CartGetxController>(CartGetxController());
  final String text;
   ShowSuccess({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // titlePadding: ,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
      title: Column(
          children:[
            SizedBox(height: 20.h,),
            Image.asset('images/succsess.png'),
            // Icon(Icons.check_circle ,size: 58, color:Colors.green,),
            SizedBox(height: 20.h,),
            Text(
              text,
              style: GoogleFonts.nunito( fontSize: 14.sp, color: Color(0xFF3E3E3E), fontWeight: FontWeight.bold ,),
              textAlign:TextAlign.center,
            ),
            SizedBox(height: 10.h,),
            ElevatedButton(onPressed: (){
              // print('a');
              controller.clear();
              Get.offAll(HomeScreen());
          }, child: Text('Ok'),
            ),
            SizedBox(height: 20.h,),



          ]
      ),

    );
  }
}
