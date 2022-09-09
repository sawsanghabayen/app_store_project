import 'package:database_app/database/controllers/user_db_controller.dart';
import 'package:database_app/models/process_response.dart';
import 'package:database_app/prefs/shared_pref_controller.dart';
import 'package:database_app/screens/widgets/app_text_field.dart';
import 'package:database_app/utils/context_extension.dart';
import 'package:database_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../getx/language_getx_controller.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> with Helpers {
  late TextEditingController _emailTextController;
  late String _language;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _language =
        SharedPrefController().getValueFor<String>(PrefKeys.language.name) ??
            'en';
    _emailTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(AppLocalizations.of(context)!.login),

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot Password',
              style: GoogleFonts.nunito(
                  fontSize: 22.sp,
                  color: Color(0xFF3E3E3E),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Don’t worry, Smart Store have simple step to create your new password',
              style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  color: const Color(0xff3E3E3E).withOpacity(0.6),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 30.h,
            ),
            AppTextField(
                hint: 'Email address',
                prefixIcon: Icons.email,
                keyboardType: TextInputType.text,
                controller: _emailTextController),
            SizedBox(
              height: 20.h,
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  _showVerifyBottomSheet();
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(325.w, 63.83.h),
                    primary: Color(0xffFF7750),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r))),
                child: Text(
                  'Confirm',
                  style: GoogleFonts.nunito(
                      fontSize: 16.sp,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 20.2.h,
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }

  void _showVerifyBottomSheet() async {
    String? verifyCode = await showModalBottomSheet<String>(
        backgroundColor: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.r),
                topLeft: Radius.circular(25.r))),
        context: context,
        builder: (context) {
          return (BottomSheet(
            backgroundColor: Colors.transparent,
            onClosing: () {},
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Thank You!',
                          style: GoogleFonts.nunito(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3E3E3E)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        // Text(
                        //   'We will sent 4 digits verification code to rizalegreyrat34@gmail.com please take a look and verify it',
                        //   style: GoogleFonts.nunito(
                        //
                        //       fontSize: 16.sp,
                        //       fontWeight: FontWeight.w300,
                        //       color: Color(0xFF3E3E3E).withAlpha(60),
                        //       height: 1.0),
                        //   textAlign:TextAlign.center ,
                        // ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text:
                              'We will sent 4 digits verification code to ',
                              style: GoogleFonts.nunito(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF3E3E3E).withAlpha(60),
                                  height: 1.0),
                              children: [
                                TextSpan(
                                  text: 'rizalegreyrat34@gmail.com ',
                                  style: GoogleFonts.nunito(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF3E3E3E).withAlpha(80),
                                      height: 1.0),

                                ),
                                TextSpan(
                                  text: 'please take a look and verify it',
                                  style: GoogleFonts.nunito(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF3E3E3E).withAlpha(60),
                                      height: 1.0),

                                )
                              ]),
                        ),
                        SizedBox(
                          height: 79.h,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _showVerifyFieldBottomSheet();
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(325.w, 63.83.h),
                                primary: Color(0xffFF7750),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r))),
                            child: Text(
                              'Verify Now',
                              style: GoogleFonts.nunito(
                                  fontSize: 16.sp,
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.bold),
                            )),

                        SizedBox(
                          height: 20.h,
                        ),

                        // RadioListTile<String>
                      ],
                    ),
                  );
                },
              );
            },
          ));
        });
  }


  void _showVerifyFieldBottomSheet() async {
    String? verifyCode = await showModalBottomSheet<String>(
        backgroundColor: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.r),
                topLeft: Radius.circular(25.r))),
        context: context,
        builder: (context) {
          return (BottomSheet(
            backgroundColor: Colors.transparent,
            onClosing: () {},
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Enter Your Code',
                          style: GoogleFonts.nunito(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3E3E3E)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Enter the 4 digits code that you recived on your email',
                          style: GoogleFonts.nunito(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF3E3E3E).withAlpha(60),
                              height: 1.0),
                          textAlign:TextAlign.center ,
                        ),
                        SizedBox(
                          height: 79.h,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              // Navigator.pop(context);
                              Navigator.pushNamed(context, '/reset_password_screen');

                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(325.w, 63.83.h),
                                primary: Color(0xffFF7750),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r))),
                            child: Text(
                              'Verify Now',
                              style: GoogleFonts.nunito(
                                  fontSize: 16.sp,
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.bold),
                            )),

                        SizedBox(
                          height: 20.h,
                        ),

                        // RadioListTile<String>
                      ],
                    ),
                  );
                },
              );
            },
          ));
        });
  }
}

// class _buildLogin extends StatelessWidget {
//   Image icon;
//   Color color;
//
//   _buildLogin({Key? key, required this.icon, required this.color})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50.h,
//       width: 50.w,
//       child:icon,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: color,
//       ),
//     );
//   }
// }
