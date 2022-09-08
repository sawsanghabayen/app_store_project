import 'package:database_app/getx/product_getx_controller.dart';
import 'package:database_app/screens/app/product_screen.dart';
import 'package:database_app/widgets/app_text.dart';
import 'package:database_app/widgets/build_type.dart';
import 'package:database_app/widgets/custom_category.dart';
import 'package:database_app/widgets/custom_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';

class ProductsScreen extends StatefulWidget {
  final int id;

  const ProductsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductGetxController controller =
      Get.put<ProductGetxController>(ProductGetxController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 0),
      () {
        controller.getProducts(id: widget.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: AppText(
        text: 'Products',
        fontSize: 20.sp,
        color: Color(0xFF3E3E3E),
        fontWeight: FontWeight.bold,
      )),
      body: GetBuilder<ProductGetxController>(
        builder: (controller) {
          return controller.loading.value
              ? CircularProgressIndicator()
              :
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 10.h),
                      child: ListView(
                        children: [
                          GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.products.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 152.w / 265.5.h,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 19.sp,
                                      mainAxisSpacing: 20.sp),
                              itemBuilder: (context, index) {
                                return CustomProduct(
                                  product: controller.products[index],
                                    );
                                  },
                                )


                          // SizedBox(
                          //   height: 15.h,
                          // ),
                          // BuildType(name: 'Related Products', onPress: () {}),
                          // SizedBox(
                          //   height: 20.h,
                          // ),
                          // SizedBox(
                          //   height: 270.h,
                          //   child: ListView.builder(
                          //     scrollDirection: Axis.horizontal,
                          //     itemBuilder: (context, index) {
                          //       return CustomProduct(
                          //         image: 'images/shirt.png',
                          //         text: 'Jacket Pullover Sweat Hoodie',
                          //         onTap: () {
                          //           Navigator.pushNamed(
                          //               context, '/products_screen');
                          //         },
                          //         margin: EdgeInsets.only(right: 20.w),
                          //       );
                          //     },
                          //     itemCount: 10,
                          //   ),
                          // ),
                        ],
                      ),
                    );
        },
      ),
    );
  }
}
