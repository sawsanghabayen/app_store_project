import 'package:database_app/api/controllers/category_api_controller.dart';
import 'package:database_app/models/category.dart';
import 'package:database_app/models/home.dart';
import 'package:database_app/screens/app/sub_categories_screen.dart';
import 'package:database_app/widgets/app_text.dart';
import 'package:database_app/widgets/custom_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../getx/categories_getx_controller.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  CategoryGetxController controller = Get.put(CategoryGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: AppText(
            text: 'Categories',
            fontSize: 17.sp,
            color: Color(0xFF3E3E3E),
            fontWeight: FontWeight.bold,
          )),
      body: GetBuilder<CategoryGetxController>(
        builder: (controller) {
          return controller.loading.value
              ? CircularProgressIndicator()
              : controller.categories.isNotEmpty ? Padding(
            padding: EdgeInsets.only(bottom: 15.h, right: 25.w, left: 25.w),
            child: ListView(
              children: [
                // AppText(text: 'Categories', fontSize: 20.sp, color: Color(0xFF3E3E3E),fontWeight: FontWeight.bold,),
                // SizedBox(height: 30.h,),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 153.w / 150.h,
                        crossAxisCount: 2,
                        crossAxisSpacing: 19.sp,
                        mainAxisSpacing: 20.sp
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Get.to(() => SubCategoriesScreen(
                                id: controller.categories[index].id));
                            // Get.to();
                            // Navigator.pushNamed(
                            //     context, '/sub_categories_screen');
                          },
                          child: CustomCategory(height: 150.h,
                            width: 153.w,
                            image: controller.categories[index].imageUrl,
                            title: controller.categories[index].nameEn,));
                    })
              ],
            ),
          ):Text('No Data');
        },

      ),
    );
  }
}
