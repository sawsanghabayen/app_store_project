import 'package:database_app/widgets/app_text.dart';
import 'package:database_app/widgets/icon_with_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        title: AppText(
          text: 'Delivery Address',
          fontSize: 17.sp,
          color: Color(0xFF222B45),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF7750),
        onPressed: () {
          Navigator.pushNamed(context, '/new_address_screen');
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 13,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(11),
                    margin: EdgeInsets.only(bottom: 20.h),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                  text: 'Home',
                                  fontSize: 13.sp,
                                  color: Color(0xFF8992A3)),
                              // Spacer(),
                              IconButton(
                                onPressed: () {},
                                padding: EdgeInsets.all(0),
                                icon: Icon(Icons.more_horiz),
                              ),
                            ],
                          ),
                          IconWithText(
                              text: '680 Mowe Court, New York, US',
                              icon: Icon(Icons.location_pin)),
                          IconWithText(
                              text: 'Sophia Benson', icon: Icon(Icons.person)),
                          IconWithText(
                              text: '+1(368)68 000 068',
                              icon: Icon(Icons.call)),
                        ]),
                    height: 144.h,
                    width: 343.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
