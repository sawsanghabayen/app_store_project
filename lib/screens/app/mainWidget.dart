import 'package:database_app/widgets/app_text.dart';
import 'package:database_app/widgets/custom_category.dart';
import 'package:database_app/widgets/custom_product.dart';
import 'package:database_app/widgets/header_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
 Padding(
   padding: EdgeInsets.only(right: 25.w, left: 25.w),
   child: ListView(
     // crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       HeaderPage(),
       SizedBox(
         height: 30.h,
       ),
       _buildType(
           name: 'Category',
           onPress: () {
             Navigator.pushNamed(context, '/category_screen');
           }),
       SizedBox(
         height: 20.h,
       ),
       SizedBox(
         height: 80.h,
         child: ListView.builder(
           itemBuilder: (context, index) {
             return InkWell(
               onTap: (){
                 Navigator.pushNamed(context, '/sub_categories_screen');
               },
               child: CustomCategory(
                 height: 80.h,
                 width: 253.w,
                 margin: EdgeInsets.only(right: 20.w),
               ),
             );
           },
           itemCount: 10,
           scrollDirection: Axis.horizontal,
         ),
       ),
       SizedBox(
         height: 30.h,
       ),
       _buildType(
           name: 'Latest Product',
           onPress: () {
             Navigator.pushNamed(context, '/products_screen');
           }),
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
             onTap: (){
                   Navigator.pushNamed(context, '/product_screen');
             },
               margin: EdgeInsets.only(right: 20.w),
             );
           },
           itemCount: 10,
         ),
       ),
       SizedBox(
         height: 20.h,
       ),
       _buildType(name: 'You May Like', onPress: () {}),
       SizedBox(
         height: 20.h,
       ),
       SizedBox(
         height: 270.h,
         child: ListView.builder(
           scrollDirection: Axis.horizontal,
           itemBuilder: (context, index) {
             return _buildProduct(
                 image: 'images/product.png',
                 text: 'Nike Jordan 1 Retro Yellow');
           },
           itemCount: 10,
         ),
       ),
     ],
   ),
 );
  }

  Container _buildProduct({required String image, required String text}) {
    return Container(
      margin: EdgeInsets.only(right: 21.w),
      height: 265.5.h,
      width: 152.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 180.h,
            width: 152.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  height: 28.h,
                  width: 28.w,
                  child: Icon(Icons.favorite_border, color: Color(0xffFF4848)),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                Image.asset(image)
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
            text: text,
            fontSize: 13.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
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
                AppText(text: '(5.0)', fontSize: 12, color: Color(0xff3E3E3E))
              ],
            ),
          ),
          AppText(
            text: '\$608',
            fontSize: 12.sp,
            color: Color(0xffFF7750),
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Container _buildType({required String name, required VoidCallback onPress}) {
    return Container(
      width: 325.w,
      height: 28.h,
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
              'See More',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }


}
