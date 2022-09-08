import 'package:database_app/getx/product_getx_controller.dart';
import 'package:database_app/screens/app/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/product.dart';
import 'app_text.dart';

class CustomProduct extends StatefulWidget {
  EdgeInsets? margin = EdgeInsets.zero;
  // final String image;
  final Product product;
  // final String text;

  CustomProduct({
    Key? key,
    this.margin,
    // required this.image,
    required this.product,
    // required this.text,
    // required this.onTap,
  }) : super(key: key);

  @override
  State<CustomProduct> createState() => _CustomProductState();
}

class _CustomProductState extends State<CustomProduct> {
  ProductGetxController productGetxController=Get.put(ProductGetxController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>
          ProductScreen(id: widget.product.id!)
        );
      },
      child: Container(
        margin: widget.margin,
        height: 300.h,
        width: 152.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 180.h,
              width: 152.w,
              child: Stack(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Image.asset(image),
                  Center(
                      child: Image(
                    image: NetworkImage(widget.product.imageUrl!),
                  )),

                  Positioned(
                    top: 3.h,
                    right: 3.w,
                    child: InkWell(
                      onTap: (){
                        productGetxController.addFavoriteProducts(product: widget.product);
                        print(widget.product.isFavorite);
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        height: 28.h,
                        width: 28.w,
                        // child: Icon(Icons.shopping_cart_outlined, color: Color(0xffFF7750),),
                        child:
                            Icon(widget.product.isFavorite!?Icons.favorite:Icons.favorite_border, color: Color(0xffFF4848)),

                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 3.h,
                    left: 3.w,
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.all(8),
                        height: 28.h,
                        width: 28.w,
                        child: Icon(Icons.shopping_cart_outlined, color: Colors.black,),
                        // child: Icon(Icons.favorite_border, color: Color(0xffFF4848)),

                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Color(0xffDEDEE0),
                  borderRadius: BorderRadius.circular(20.r)),
            ),
            // SizedBox(
            //   height: 15.h,
            // ),
            AppText(
              text: widget.product.nameEn!,
              fontSize: 13.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 20.h,
              child: AppText(
                text: '\$${ widget.product.price!}',
                fontSize: 12.sp,
                color: Color(0xffFF7750),
                fontWeight: FontWeight.bold,
              ),
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
                        size: 20,
                      );
                    },
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                  ),
                  AppText(text: '${ widget.product.productRate!}', fontSize: 12, color: Color(0xff3E3E3E))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
