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
import '../../provider/language_provider.dart';
import '../../widgets/app_text.dart';

class ChangeMobileScreen extends StatefulWidget {
  const ChangeMobileScreen({Key? key}) : super(key: key);

  @override
  State<ChangeMobileScreen> createState() => _ChangeMobileScreenState();
}

class _ChangeMobileScreenState extends State<ChangeMobileScreen> with Helpers {
  late TextEditingController _oldPhoneTextController;
  late TextEditingController _newPhoneTextController;
  bool _obsecure = true;
  bool _obsecurePass2 = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _oldPhoneTextController = TextEditingController();
    _newPhoneTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _oldPhoneTextController.dispose();
    _newPhoneTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: AppText(
          text: 'Change Number',
          fontSize: 17.sp,
          color: Color(0xFF222B45),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Change Number',
              style: GoogleFonts.nunito(
                  fontSize: 22.sp,
                  color: Color(0xFF3E3E3E),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Enter your old phone number:',
              style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  color: const Color(0xff3E3E3E).withOpacity(0.6),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 15.h,
            ),
            AppTextField(
                hint: 'Old Number',
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.phone,
                controller: _oldPhoneTextController),
            SizedBox(
              height: 20.h,
            ),

            Text(
              'Enter your old phone number:',
              style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  color: const Color(0xff3E3E3E).withOpacity(0.6),
                  fontWeight: FontWeight.w400),
            ),

            SizedBox(
              height: 20.h,
            ),
            AppTextField(
                hint: 'New Number',
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.phone,
                controller: _oldPhoneTextController),

            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  // _showSuccessResetPasswordDialog(text: 'Change Password Success',subText: 'Tap to login to your account');
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(325.w, 63.83.h),
                    primary: Color(0xffFF7750),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r))),
                child: Text(
                  'Edit Phone',
                  style: GoogleFonts.nunito(fontSize: 16.sp,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold),
                )),

            SizedBox(height: 50.h,),
          ],
        ),
      ),
    );
  }




}

class ShowSuccess extends StatelessWidget {
  final String text;
  final String subText;
  const ShowSuccess({
    Key? key,
    required this.text,
    required this.subText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // titlePadding: ,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
      title: Column(
          children:[
            SizedBox(height: 20.h,),
            Icon(Icons.check_circle ,size: 58, color:Colors.green,),
            SizedBox(height: 20.h,),
            Text(
              text,
              style: GoogleFonts.nunito( fontSize: 17, color: Color(0xFF3E3E3E), fontWeight: FontWeight.bold ,),
              textAlign:TextAlign.center,
            ),
            SizedBox(height: 10.h,),
            TextButton(
                onPressed: (){
                  Navigator.pop(context ,true);
                  // Navigator.pushReplacementNamed(context, '/login_screen');


                }, child: Text(subText,style: GoogleFonts.nunito(fontSize: 14, color: Color(0xFFCACACA) ,fontWeight: FontWeight.normal),)),
            SizedBox(height: 20.h,),



          ]
      ),

    );
  }
}
