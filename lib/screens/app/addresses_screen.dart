import 'package:database_app/utils/context_extension.dart';
import 'package:database_app/widgets/app_text.dart';
import 'package:database_app/widgets/icon_with_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../getx/address_getx_controller.dart';
import '../../models/process_response.dart';

class AddressesScreen extends StatelessWidget {
   AddressesScreen({Key? key}) : super(key: key);
  AddressGetxController controller=Get.put(AddressGetxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        title: AppText(
          text: 'Delivery Address',
          fontSize: 17.sp,
          color: Color(0xFF222B45),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF7750),
        onPressed: () {
          Navigator.pushNamed(context, '/new_address_screen');
        },
        child: Icon(Icons.add),
      ),
      body: GetX<AddressGetxController>(
        builder: (controller) {
          return   controller.loading.value
              ? Center(child: CircularProgressIndicator())
              : Column(
            children: [
              Expanded(
                flex: 13,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.addresses.value.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) async {
                          // print(controller.addresses[index].id!);
                          ProcessResponse process =
                          await controller.deleteAddress(controller.addresses[index].id!);
                          context.showSnackBar(
                              message: process.message,
                              error: !process.success);
                        },
                        background: Container(color: Colors.red),
                        child: Container(
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
                                            .addresses[index].name!,
                                        fontSize: 13.sp,
                                        color: Color(0xFF8992A3)),
                                    // Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.all(0),
                                      icon: Icon(Icons.more_horiz),
                                    ),
                                  ],
                                ),
                                IconWithText(
                                    text: controller
                                        .addresses[index].city!.nameEn!,
                                    icon: Icon(Icons.location_city)),
                                IconWithText(
                                    text:
                                    controller.addresses[index].info!,
                                    icon: Icon(Icons.location_pin)),
                                IconWithText(
                                    text: controller
                                        .addresses[index].contactNumber!,
                                    icon: Icon(Icons.call)),
                              ]),
                          height: 144.h,
                          width: 343.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },

      ),
    );
  }
}

