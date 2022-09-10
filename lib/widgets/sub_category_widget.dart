
import 'package:cached_network_image/cached_network_image.dart';
import 'package:database_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/sub_category.dart';

class SubCategoryWidget extends StatelessWidget {
  final SubCategory subCategory;
  final void Function() onTap;

  SubCategoryWidget({required this.subCategory, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.h)),
        elevation: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: CachedNetworkImage(
                height: 160.h,
                width: double.infinity,
                imageUrl: subCategory.imageUrl,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,

              ),
            ),
            AppText(
              text: subCategory.nameEn,
              fontSize: 15.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}