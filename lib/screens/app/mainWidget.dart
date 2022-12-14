import 'package:database_app/getx/address_getx_controller.dart';
import 'package:database_app/getx/product_getx_controller.dart';
import 'package:database_app/models/home.dart';
import 'package:database_app/screens/app/product_screen.dart';
import 'package:database_app/screens/app/sub_categories_screen.dart';
import 'package:database_app/utils/context_extension.dart';
import 'package:database_app/widgets/app_text.dart';
import 'package:database_app/widgets/custom_category.dart';
import 'package:database_app/widgets/custom_product.dart';
import 'package:database_app/widgets/header_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../getx/home_getx_controller.dart';
import '../../models/category.dart';
import '../../prefs/shared_pref_controller.dart';
import 'category_screen.dart';

class MainScreenWidget extends StatelessWidget {
  HomeGetxController controller = Get.put(HomeGetxController());
  ProductGetxController productGetxController = Get.put(ProductGetxController());



  @override
  Widget build(BuildContext context) {
    return GetX<HomeGetxController>(
      builder: (HomeGetxController controller) {
        return controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : controller.home != null
                ? Padding(
                    padding: EdgeInsets.only(right: 20.w, left: 25.w),
                    child: ListView(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderPage<MySlider>(images: controller.home.value.slider),
                        SizedBox(
                          height: 30.h,
                        ),
                        _buildType(context,
                            name: context.localizations.category, onPress: () {
                          // Navigator.pushNamed(context, '/category_screen');
                          Get.to(CategoryScreen());
                        }),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 80.h,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              Categories category=controller.home.value.categories[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategoriesScreen(id:controller.home.value.categories[index].id ),));
                                  // Get.to(() => SubCategoriesScreen(
                                  //     id: controller.home.value.categories[index].id));
                                  // Get.to();
                                  // Navigator.pushNamed(
                                  //     context, '/sub_categories_screen');
                                },
                                child: CustomCategory(
                                  height: 80.h,
                                  image: category.imageUrl,
                                  title: category.nameEn,
                                  width: 253.w,
                                  margin: EdgeInsets.only(
                                      right: SharedPrefController()
                                                  .getValueFor<String>(
                                                      PrefKeys.language.name) ==
                                              'ar'
                                          ? 0.w
                                          : 20.w,
                                      left: SharedPrefController()
                                                  .getValueFor<String>(
                                                      PrefKeys.language.name) ==
                                              'ar'
                                          ? 20.w
                                          : 0.w),
                                ),
                              );
                            },
                            itemCount: controller.home.value.categories.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        _buildType(context,
                            name: context.localizations.latest_product,
                            onPress: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) {
                          //
                          //  return ProductScreen(id: controller.home.value.categories.first.id);
                          // },));
                          // Navigator.pushNamed(context, '/products_screen');
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
                                product: controller.home.value.latestProducts[index],
                                margin: EdgeInsets.only(
                                    right: SharedPrefController()
                                                .getValueFor<String>(
                                                    PrefKeys.language.name) ==
                                            'ar'
                                        ? 0.w
                                        : 20.w,
                                    left: SharedPrefController()
                                                .getValueFor<String>(
                                                    PrefKeys.language.name) ==
                                            'ar'
                                        ? 20.w
                                        : 0.w),
                              );
                            },
                            itemCount: controller.home.value.latestProducts.length,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        _buildType(context,
                            name: context.localizations.may_like,
                            onPress: () {}),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 270.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomProduct(
                                product: controller.home.value.famousProducts[index],
                                margin: EdgeInsets.only(
                                    right: SharedPrefController()
                                                .getValueFor<String>(
                                                    PrefKeys.language.name) ==
                                            'ar'
                                        ? 0.w
                                        : 20.w,
                                    left: SharedPrefController()
                                                .getValueFor<String>(
                                                    PrefKeys.language.name) ==
                                            'ar'
                                        ? 20.w
                                        : 0.w),
                              );
                            },
                            itemCount:  controller.home.value.latestProducts.length,
                          ),
                        ),
                        SizedBox(height: 15.h,)
                      ],
                    ),
                  )
                : Text('error');
      },
    );
  }

  Container _buildType(BuildContext context,
      {required String name, required VoidCallback onPress}) {
    return Container(
      width: 325.w,
      height: 30.h,
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
              context.localizations.see_more,
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
