import 'package:cached_network_image/cached_network_image.dart';
import 'package:database_app/screens/app/products_screen.dart';
import 'package:database_app/widgets/app_text.dart';
import 'package:database_app/widgets/custom_category.dart';
import 'package:database_app/widgets/sub_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../getx/categories_getx_controller.dart';

class SubCategoriesScreen extends StatefulWidget {
  final int id;

  SubCategoriesScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  CategoryGetxController controller = Get.put(CategoryGetxController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      await controller.getSubCategories(id: widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: AppText(
        text: 'SubCategories',
        fontSize: 17.sp,
        color: Color(0xFF3E3E3E),
        fontWeight: FontWeight.bold,
      )),
      body: GetBuilder<CategoryGetxController>(
        builder: (controller) {
          return controller.loading.value
              ? Center(child: CircularProgressIndicator())
              :  Padding(
                      // padding: EdgeInsets.symmetric(horizontal: 25.w ),
                      padding: EdgeInsets.only(
                          bottom: 15.h, right: 25.w, left: 25.w),
                      child: ListView(
                        children: [
                          AppText(
                            text: 'Sub Categories',
                            fontSize: 17.sp,
                            color: Color(0xFF3E3E3E),
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.subCategories.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 153.w / 220.h,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 19.sp,
                                      mainAxisSpacing: 20.sp),
                              itemBuilder: (context, index) {
                                return SubCategoryWidget(
                                    subCategory:
                                        controller.subCategories[index],
                                    onTap: () {
                                      Get.to(() => ProductsScreen(
                                          id: controller
                                              .subCategories[index].id));
                                    });
                              })
                        ],
                      ),
                    );
        },
      ),
    );
  }
}
