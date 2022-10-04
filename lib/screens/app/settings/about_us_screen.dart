import 'package:database_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: AppText(
        text: 'About Us',
        fontSize: 17.sp,
        color: Color(0xFF3E3E3E),
        fontWeight: FontWeight.bold,
      ),),
      body:Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.w ,),

        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,


            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffF4F5F7)),
                  borderRadius: BorderRadius.circular(15.r),
                  color: Colors.white,


                ),
                height: 500.h,
                width:double.infinity,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        // AppText(text: 'App Store', fontSize: 24.sp,
                        //   color: Color(0xFF3E3E3E),
                        //   fontWeight: FontWeight.bold,) ,
                        // SizedBox(height: 15.h,),
                        Container(
                          height: 67.97.h,
                          width: 214.46.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: const AssetImage('images/logo_2.png') ,width: 45.w, height: 45.h,),
                              SizedBox(width: 10.w,),
                              // SizedBox(
                              //   width: 13.1.w,
                              // ),
                              Text(
                                'SMART STORE',
                                style: GoogleFonts.nunito(

                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),

                        ),
                        // AppText(text: 'About Store App', fontSize: fontSize, color: color),




                        // AppTextField(hint: 'name', prefixIcon: Icons.person, keyboardType: TextInputType.text, controller: _nameTextController)


                      ]),
                ),
              ),
              SizedBox(height: 50.h,),




            ]),
      ),
    );
  }
}
