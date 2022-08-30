import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';
class BuildType extends StatelessWidget {
  final String name;
  final VoidCallback  onPress;
  const BuildType({ required this.name,
    required this.onPress,Key? key}) : super(key: key ,
   );

  @override
  Widget build(BuildContext context) {
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
