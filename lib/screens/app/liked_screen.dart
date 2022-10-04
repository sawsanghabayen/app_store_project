import 'package:database_app/getx/product_getx_controller.dart';
import 'package:database_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LikedScreen extends StatelessWidget {
  /*const*/ LikedScreen({Key? key}) : super(key: key);
  ProductGetxController productGetxController=Get.put(ProductGetxController());

  // ProductGetxController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: GetX<ProductGetxController>(
        init: ProductGetxController(),
        builder: (controller) {
          return controller.loading.value
              ? Center(child: CircularProgressIndicator())
              : controller.favoriteProducts.isNotEmpty ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: ListView.builder(
              itemCount: controller.favoriteProducts.length,
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
                                image: NetworkImage(
                                    controller.favoriteProducts[index]
                                        .imageUrl),
                                width: 77.15,
                                height: 54.13,
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 6.5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: controller.favoriteProducts[index]
                                      .nameEn,
                                  fontSize: 14.sp,
                                  color: Color(0xFF3E3E3E),
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                AppText(
                                  text: controller.favoriteProducts[index]
                                      .infoEn.length >= 30 ?controller.favoriteProducts[index].infoEn.substring(0,30) +' ...': controller
                                      .favoriteProducts[index].infoEn ,
                                  fontSize: 14.sp,
                                  color: Color(0xFFCACACA),
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    AppText(
                                      text: '\$${controller
                                          .favoriteProducts[index].price}',
                                      fontSize: 12.sp,
                                      color: Color(0xffFF7750),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      width: 150.w,
                                    ),
                                    Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFFFAFAFA),
                                        ),
                                        height: 28.h,
                                        width: 28.w,
                                        child: InkWell(
                                          onTap: (){
                                            productGetxController.addFavoriteProducts(product: controller.favoriteProducts[index]);
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        )),
                                  ],
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
          ) : Center(child: Text('No Items',style: GoogleFonts.cairo(fontWeight: FontWeight.bold ,fontSize: 30.sp),));
        },

      ),
    );
  }
}
