import 'package:database_app/getx/product_getx_controller.dart';
import 'package:database_app/screens/app/product_screen.dart';
import 'package:database_app/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../getx/cart_getx_controller.dart';
import '../getx/home_getx_controller.dart';
import '../models/cart.dart';
import '../models/process_response.dart';
import '../models/product.dart';
import '../models/product_details.dart';
import '../prefs/shared_pref_controller.dart';
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

  // ProductGetxController productGetxController=Get.put(ProductGetxController());
  CartGetxController cartGetxController = Get.put(CartGetxController());
   String stars='';
   String halfStar='';

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 0),(){
      ProductGetxController.to.getProductDetails(id: widget.product.id);
    });




  }


  @override
  Widget build(BuildContext context) {
    stars =widget.product.overalRate.toString();
    halfStar=stars.substring(2,3);

    // print(halfStar);
    return  GestureDetector(
      onTap: (){
        Get.to(()=>
            ProductScreen(id: widget.product.id)
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
              clipBehavior: Clip.antiAlias,
              height: 180.h,
              width: 152.w,
              child: Stack(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Image.asset(image),
                  Center(
                      child: Image(
                        image: NetworkImage(widget.product.imageUrl),
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      )),

                  Positioned(
                    top: 3.h,
                    right: 3.w,
                    child: InkWell(
                      onTap: (){
                        setState((){
                          widget.product.isFavorite=!widget.product.isFavorite;


                        });
                        ProductGetxController.to.productDetails.value!.isFavorite=widget.product.isFavorite;
                        // productGetxController.products[getIndex(productGetxController.productDetails.value!.id)].isFavorite=widget.product.isFavorite!;
                        ProductGetxController.to.addFavoriteProducts(product: widget.product);

                        // print(productGetxController.isFav.value);
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        height: 28.h,
                        width: 28.w,
                        // child: Icon(Icons.shopping_cart_outlined, color: Color(0xffFF7750),),
                        child:
                        Icon( widget.product.isFavorite?Icons.favorite:Icons.favorite_border, color: Color(0xffFF4848)),

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
                      onTap: ()async{
                        getCart(ProductGetxController.to.productDetails.value!);
                        ProcessResponse process= await cartGetxController.create(getCart(ProductGetxController.to.productDetails.value!));
                        context.showSnackBar(message: process.message,error: !process.success);
                      },
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
                      )
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
              text: widget.product.nameEn,
              fontSize: 13.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 20.h,
              child: AppText(
                text: '\$${ widget.product.price}',
                fontSize: 12.sp,
                color: Color(0xffFF7750),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.h,
              width: double.infinity,
              child: Row(

                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                    itemCount: int.parse(halfStar) == 5? double.parse(widget.product.overalRate).floor()-1:double.parse(widget.product.overalRate).floor(),
                    scrollDirection: Axis.horizontal,
                  ),
                   int.parse(halfStar) == 5?
                   Icon( Icons.star_half_outlined, color: Colors.yellow,
                       size: 20,) :
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Icon(
                        Icons.star_border_outlined,
                        color: Colors.yellow,
                        size: 20,
                      );
                    },

                    itemCount:
                    5- double.parse(widget.product.overalRate).floor()
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
                          size: 20,
                        );
                      },

                      itemCount:
                      5- double.parse(widget.product.overalRate).floor()
                      ,
                      scrollDirection: Axis.horizontal,
                    ),

                  SizedBox(width: 20.w,),
                  AppText(text: widget.product.overalRate, fontSize: 12, color: Color(0xff3E3E3E))
                ],
              ),
            ),
          ],
        ),
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
  // int getIndex(int id) {
  //   return _homeGetxController.home.value.latestProducts.indexWhere((element) {
  //     return element.id == id;
  //   });
  // }
}
