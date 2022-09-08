import 'package:database_app/screens/app/addresses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../prefs/shared_pref_controller.dart';
import 'app_text.dart';
// import 'package:shopping_online/widgets/app_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 74.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // backgroundColor: Color(0xFFFF7750),

              height: 55.h,
              width: 176.w,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 25,
                    // backgroundColor: Color(0xFFFF7750),
                    backgroundImage: AssetImage('images/avatar.png'),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  AppText(
                      text: SharedPrefController()
                              .getValueFor<String>(PrefKeys.name.name) ??
                          '',
                      fontSize: 16.sp,
                      color: Colors.black),
                  // Divider(color: Col,),
                ],
              ),
            ),
            Divider(color: Colors.black, height: 50.h),
            // SizedBox(
            //   height: 50.h,
            // ),
            ListTile(
              title: AppText(
                text: 'Saved Payments',
                fontSize: 14.sp,
                color: Color(0xffFF7750),
                fontWeight: FontWeight.bold,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/payments_screen');
              },
            ),
            ListTile(
              title: AppText(
                text: 'My Address',
                fontSize: 14.sp,
                color: Color(0xff3E3E3E),
              ),
              onTap: () {
                Navigator.pop(context);
                Get.to(() {
                  return AddressesScreen();
                });
                // Get.to(AddressesScreen());// Navigator.pushNamed(context ,'/addresses_screen');
              },
            ),
            // ListTile(
            //   title: AppText(
            //     text: 'Category',
            //     fontSize: 14.sp,
            //     color: Color(0xff3E3E3E),
            //   ),
            //   onTap: () {
            //     Navigator.pop(context);
            //     Navigator.pushNamed(context ,'/');
            //   },
            // ),
            ListTile(
              title: AppText(
                text: 'My Orders',
                fontSize: 14.sp,
                color: Color(0xff3E3E3E),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/orders_screen');
              },
            ),
            // ListTile(
            //   title: AppText(
            //     text: 'My Likes',
            //     fontSize: 14.sp,
            //     color: Color(0xff3E3E3E),
            //   ),
            //   onTap: () {
            //     Navigator.pop(context);
            //     Navigator.pushNamed(context ,'/liked_screen');
            //   },
            // ),
            SizedBox(
              height: 50.h,
            ),
            // ListTile(
            //   title: AppText(
            //     text: 'Contact Us',
            //     fontSize: 14.sp,
            //     color: Color(0xff3E3E3E),
            //   ),
            //   onTap: () {
            //     Navigator.pop(context);
            //     Navigator.pushNamed(context ,'/');
            //   },
            // ),
            ListTile(
              // leading: Icon(Icons.settings_outlined),
              title: AppText(
                text: 'Settings',
                fontSize: 14.sp,
                color: Color(0xff3E3E3E),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/setting_screen');
              },
            ),
            ListTile(
              title: AppText(
                text: 'Help',
                fontSize: 14.sp,
                color: Color(0xff3E3E3E),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: AppText(
                text: 'Logout',
                fontSize: 14.sp,
                color: Color(0xff3E3E3E),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
