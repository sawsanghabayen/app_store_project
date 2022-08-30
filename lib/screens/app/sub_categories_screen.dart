import 'package:database_app/widgets/app_text.dart';
import 'package:database_app/widgets/custom_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({Key? key}) : super(key: key);

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
      body: Padding(
        // padding: EdgeInsets.symmetric(horizontal: 25.w ),
        padding: EdgeInsets.only(bottom: 15.h , right: 25.w ,left: 25.w),

        child: ListView(
          children: [
            AppText(text: 'Sub Categories', fontSize: 17.sp, color: Color(0xFF3E3E3E),fontWeight: FontWeight.bold,),
            SizedBox(height: 30.h,),
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 153.w/80.h,
                    crossAxisCount: 2,
                    crossAxisSpacing: 19.sp,
                    mainAxisSpacing: 20.sp
                ),
                itemBuilder: (context, index) {
                  return CustomCategory(height: 80.h, width: 153.w);
                })
          ],
        ),
      ),
    );
  }
}
