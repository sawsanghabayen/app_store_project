import 'dart:async';

import 'package:database_app/api/controllers/product_api_controller.dart';
import 'package:database_app/getx/home_getx_controller.dart';
import 'package:database_app/getx/product_getx_controller.dart';
import 'package:database_app/models/home.dart';
import 'package:database_app/models/process_response.dart';
import 'package:database_app/screens/app/home_screen.dart';
import 'package:database_app/screens/widgets/page_view_indicator.dart';
import 'package:database_app/utils/context_extension.dart';
import 'package:database_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../getx/cart_getx_controller.dart';
import '../../models/cart.dart';
import '../../models/product.dart';
import '../../models/product_details.dart';
import '../../prefs/shared_pref_controller.dart';
import '../../widgets/header_slider.dart';

class ProductScreen extends StatefulWidget {

  final int id;

   ProductScreen({Key? key, required this.id}) : super(key: key);

//
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  GlobalKey _scaffold = GlobalKey();

  // HomeGetxController _homeGetxController = Get.put(HomeGetxController());
  ProductGetxController controller = Get.put(ProductGetxController());
  CartGetxController cartGetxController = Get.put(CartGetxController());
  ProductGetxController productGetxController =
      Get.put(ProductGetxController());
  String stars='';
  String halfStar='';
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 0), () {
      controller.getProductDetails(id: widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    stars =controller.productDetails.value!.overalRate.toString();
    halfStar=stars.substring(2,3);
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(),
      body: GetX<ProductGetxController>(
          builder: (ProductGetxController controller) {
        return controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  HeaderPage<ProductImages>(
                      images: ProductGetxController
                          .to.productDetails.value!.images!),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                        text: controller
                                            .productDetails.value!.nameEn,
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    AppText(
                                      text:
                                          '\$${controller.productDetails.value!.price.toString()}',
                                      fontSize: 17.sp,
                                      color: Color(0xffFF7750),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      controller
                                          .productDetails.value!.isFavorite =
                                      !controller
                                          .productDetails.value!.isFavorite;
                                      // _homeGetxController.home.value.latestProducts[getIndex(controller.productDetails.value!.id)].isFavorite=   controller
                                      //     .productDetails.value!.isFavorite;
                                    });
                                    controller.addFavoriteProducts(
                                        product: HomeGetxController.to.home.value.latestProducts[
                                            getIndex(controller
                                                .productDetails.value!.id)]);

                                    HomeGetxController.to.home.value.famousProducts= HomeGetxController.to.home.value.latestProducts;

                                  },
                                  icon: Icon(
                                    controller.productDetails.value!.isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                  ),
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ),
                          AppText(
                            text: controller.productDetails.value!.infoEn,
                            fontSize: 16.sp,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          SizedBox(
                            height: 20.h,
                            width: double.infinity,
                            child:  Row(

                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 30.sp,
                                    );
                                  },

                                  itemCount:int.parse(halfStar) == 5? double.parse(controller.productDetails.value!.overalRate).floor()-1 :double.parse(controller.productDetails.value!.overalRate).floor(),
                                  scrollDirection: Axis.horizontal,
                                ),
                                int.parse(halfStar) == 5?
                                Icon( Icons.star_half_outlined, color: Colors.yellow,
                                  size: 30.sp,) :
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Icon(
                                      Icons.star_border_outlined,
                                      color: Colors.yellow,
                                      size: 30.sp,
                                    );
                                  },

                                  itemCount:

                                  5- double.parse(controller.productDetails.value!.overalRate).floor()
                                  ,
                                  scrollDirection: Axis.horizontal,
                                ),
                                if(int.parse(halfStar) == 5)
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Icon(

                                        Icons.star_border_outlined,
                                        color: Colors.yellow,
                                        // color: Colors.grey,
                                        size: 30.sp,
                                      );
                                    },

                                    itemCount:
                                    5- double.parse(controller.productDetails.value!.overalRate).floor()
                                    ,
                                    scrollDirection: Axis.horizontal,
                                  ),
                              Spacer(),
                                AppText(text: controller.productDetails.value!.overalRate, fontSize: 15.sp, color: Color(0xff3E3E3E))
                              ],
                            ),

                          ),
                          SizedBox(height: 20.h,),
                          ElevatedButton(
                            onPressed: () {
                              show();

                            }
                           ,
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(60.w, 50.83.h),
                                primary: Color(0xffFF7750),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r))),
                            child: AppText(
                                text: 'Rate Now!',
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),

                          Spacer(flex: 3),
                          ElevatedButton(
                            onPressed: () async {
                              getCart(controller.productDetails.value!);
                              ProcessResponse process =
                                  await cartGetxController.create(getCart(
                                      controller.productDetails.value!));
                              context.showSnackBar(
                                  message: process.message,
                                  error: !process.success);
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
      }),
    );

  }

  void show(){
    showDialog(context: context, builder:(contexts){
      return RatingDialog(
        title:  Text('Rating Product',style: GoogleFonts.cairo(fontSize: 15.sp),),
        message: Text('Tap on star to rate us',style: GoogleFonts.cairo(fontSize: 15.sp),),
        image: Icon(Icons.star ,size: 100,color: Colors.red,),
        submitButtonText: 'SUBMIT' ,
        onSubmitted: (response) async{
          ProcessResponse processResponse = await ProductApiController().productRate(id: controller.productDetails.value!.id ,ratting:response.rating  );
          print(processResponse.success);
          if(processResponse.success){
            await HomeGetxController().getHome();
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            //   return HomeScreen();
            // },));
            Navigator.of(context).pushReplacementNamed('/home_screen');


            // Navigator.pushReplacementNamed(context, '/home_screen');

            // context.showSnackBar(message: processResponse.message ,error: !processResponse.success);

          }
          context.showSnackBar(message: processResponse.message ,error: !processResponse.success);
          // print('${response.rating}');
        },
        initialRating:double.parse(controller.productDetails.value!.productRate) ,


      );


    } );
  }
  Cart getCart(ProductDetails product) {
    // print(int.parse(SharedPrefController().getValueFor<String>(PrefKeys.id.name)!).runtimeType);
    Cart cart = Cart();
    cart.productId = product.id;
    cart.price = product.price as double;
    cart.total = product.price as double;
    cart.userId = int.parse(
        SharedPrefController().getValueFor<String>(PrefKeys.id.name)!);
    cart.count = 1;
    cart.productName = product.nameEn;
    cart.productImage = product.imageUrl;

    return cart;
  }

  int getIndex(int id) {
    return  HomeGetxController.to.home.value.latestProducts.indexWhere((element) {
      return element.id == id;
    });
  }



  // void _confirmRatingDialog(BuildContext context) async {
  //   bool? result = await showDialog<bool>(
  //     context: context,
  //     // barrierColor: Colors.red.shade100.withOpacity(0.5),
  //     barrierDismissible: false,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text(
  //           'Rate Product',
  //         ),
  //         titleTextStyle: GoogleFonts.cairo(
  //           fontSize: 16,
  //           color: Colors.black,
  //         ),
  //         content: Text(
  //           '',
  //         ),
  //         contentTextStyle: GoogleFonts.cairo(
  //           fontSize: 13,
  //           color: Colors.black45,
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context, true);
  //             },
  //             child: Text(
  //               'Submit',
  //               style: GoogleFonts.cairo(color: Colors.red),
  //             ),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context, false);
  //             },
  //             child: Text(
  //               'Cancel',
  //               style: GoogleFonts.cairo(),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  //   if (result ?? false) {
  //     // bool cleared = await SharedPrefController().removeValueFor(PrefKeys.loggedIn.name);
  //
  //
  //   }
  // }
}
