import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';
class IconWithText extends StatelessWidget {
  final String text;
  final Icon icon;
  const IconWithText({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 10.w,
        ),
        AppText(
            text: text,
            fontSize: 15,
            color: Color(0xFF222B45)),
        // SizedBox(height: 12.h,)
      ],
    );
  }
}