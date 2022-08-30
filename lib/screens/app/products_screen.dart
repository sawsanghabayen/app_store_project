import 'package:database_app/widgets/app_text.dart';
import 'package:database_app/widgets/build_type.dart';
import 'package:database_app/widgets/custom_category.dart';
import 'package:database_app/widgets/custom_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
        // padding: EdgeInsets.only( right: 25.w ,left: 25.w),

        child: ListView(
          children: [
            // AppText(text: 'Products', fontSize: 20.sp, color: Color(0xFF3E3E3E),fontWeight: FontWeight.bold,),
            // SizedBox(
            //   height: 30.h,
            // ),
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 152.w / 265.5.h,
                    crossAxisCount: 2,
                    crossAxisSpacing: 19.sp,
                    mainAxisSpacing: 20.sp),
                itemBuilder: (context, index) {
                  return CustomProduct(
                    image: 'images/shirt.png',
                    text: 'Jacket Pullover Sweat Hoodie',
                    onTap: () {},
                  );
                }),
            SizedBox(
              height: 15.h,
            ),
            BuildType(name: 'Related Products', onPress: () {}),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 270.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomProduct(
                    image: 'images/shirt.png',
                    text: 'Jacket Pullover Sweat Hoodie',
                    onTap: () {
                      Navigator.pushNamed(context, '/products_screen');
                    },
                    margin: EdgeInsets.only(right: 20.w),
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
