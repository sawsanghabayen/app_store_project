import 'dart:async';

import 'package:database_app/getx/product_getx_controller.dart';
import 'package:database_app/models/home.dart';
import 'package:database_app/models/process_response.dart';
import 'package:database_app/screens/widgets/page_view_indicator.dart';
import 'package:database_app/utils/context_extension.dart';
import 'package:database_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../../getx/cart_getx_controller.dart';
import '../../models/cart.dart';
import '../../models/product.dart';
import '../../models/product_details.dart';
import '../../prefs/shared_pref_controller.dart';
import '../../widgets/header_slider.dart';

class ProductScreen extends StatefulWidget {
  final int id;
  const ProductScreen({Key? key ,required this.id}) : super(key: key);
//
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductGetxController controller = Get.put(ProductGetxController());
  CartGetxController cartGetxController = Get.put(CartGetxController());


  @override
  void initState()
  {
    super.initState();
    Future.delayed(Duration(seconds: 0),(){
    controller.getProductDetails(id: widget.id);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetX<ProductGetxController>(
          builder: (ProductGetxController controller ) {
            return controller.loading.value
                ?  Center(child: CircularProgressIndicator())
                :  Column(
              children: [
                HeaderPage<ProductImages>(images: ProductGetxController.to.productDetails.value!.images!),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20.h),
                          width: 325.w,
                          height: 50.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                      text: controller.productDetails.value!.nameEn,
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  AppText(
                                    text: '\$${controller.productDetails.value!.price.toString()}',
                                    fontSize: 17.sp,
                                    color: Color(0xffFF7750),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: (){
                                    controller.addFavoriteProducts(product: controller.products.value.firstWhere((element) => element.id==controller.productDetails.value!.id));
                                },
                                icon: Icon(controller
                                    .productDetails
                                    .value!.isFavorite?
                                Icons.favorite:Icons.favorite_border,),

                                color: Colors.red,
                              )
                            ],
                          ),
                        ),
                        AppText(
                          text:
                          controller.productDetails.value!.infoEn,
                          fontSize: 16.sp,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        SizedBox(
                          height: 20.h,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 35,
                                  );
                                },
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                              ),
                              AppText(
                                  text: '(5.0)',
                                  fontSize: 12,
                                  color: Color(0xff3E3E3E))
                            ],
                          ),
                        ),
                        Spacer(flex: 3),
                        ElevatedButton(
                          onPressed: () async{
                            getCart(controller.productDetails.value!);
                          ProcessResponse process= await cartGetxController.create(getCart(controller.productDetails.value!));
                          context.showSnackBar(message: process.message,error: !process.success);
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(325.w, 63.83.h),
                              primary: Color(0xffFF7750),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r))),
                          child: AppText(
                              text: 'Add To Cart',
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(flex: 1),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
      ),

      );
  }
  Cart getCart(ProductDetails product) {
    // print(int.parse(SharedPrefController().getValueFor<String>(PrefKeys.id.name)!).runtimeType);
    Cart cart = Cart();
    cart.productId = product.id;
    cart.price = product.price as double;
    cart.total = product.price as double;
    cart.userId = int.parse(SharedPrefController().getValueFor<String>(PrefKeys.id.name)!);
    cart.count = 1;
    cart.productName = product.nameEn;
    cart.productImage = product.imageUrl;

    return cart;
  }
}
