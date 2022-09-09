import 'package:database_app/api/controllers/users_api_controller.dart';
import 'package:database_app/database/controllers/user_db_controller.dart';
import 'package:database_app/models/process_response.dart';
import 'package:database_app/prefs/shared_pref_controller.dart';
import 'package:database_app/screens/app/home_screen.dart';
import 'package:database_app/screens/widgets/app_text_field.dart';
import 'package:database_app/utils/context_extension.dart';
import 'package:database_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/city.dart';
import '../../getx/language_getx_controller.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> with Helpers {
  late TextEditingController _mobileTextController;
  late TextEditingController _verificationCodeTextController;

  bool _obsecure = true;
  late String? _gender;
  late int? _selectedCityId =1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileTextController = TextEditingController();
    _verificationCodeTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mobileTextController.dispose();
    _verificationCodeTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(AppLocalizations.of(context)!.login),

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello There',
              style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  color: const Color(0xff3E3E3E).withOpacity(0.6),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Activate Your Account',
              style: GoogleFonts.nunito(
                  fontSize: 22.sp,
                  color: const Color(0xff3E3E3E),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.h,
            ),
            AppTextField(
                hint: 'Mobile Number',
                prefixIcon: Icons.verified,
                keyboardType: TextInputType.number,
                controller: _mobileTextController),
            SizedBox(
              height: 30.h,
            ),
            AppTextField(
                hint: 'Verification Code',
                prefixIcon: Icons.verified,
                keyboardType: TextInputType.number,
                controller: _verificationCodeTextController),


            const Spacer(),
            ElevatedButton(
                onPressed: () async{
                    _performActivate();

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
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('You have an account? Please',
                    style: GoogleFonts.nunito(
                        color: Color(0xFF707070), fontSize: 14)),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/login_screen'),
                  child: Text('Sign In',
                      style: GoogleFonts.nunito(
                          color: Color(0xFFFF7750), fontSize: 14)),
                  style: TextButton.styleFrom(primary: Color(0xffF3651F)),
                )
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }


  void _performActivate() async{
    if (_checkData()) {
      ProcessResponse process=await   _activate();
      if(process.success){
        Navigator.pushReplacementNamed(context, '/login_screen');
      }
      context.showSnackBar(message: process.message,error: !process.success);
    }
  }
  bool _checkData() {
    if (_verificationCodeTextController.text.isNotEmpty &&_mobileTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar( message: 'Enter Required Data!', error: true);
    return false;
  }

  Future<ProcessResponse> _activate() async {
    ProcessResponse processResponse =await UsersApiController().activate(mobile: int.parse(_mobileTextController.text)
        , code:int.parse(_verificationCodeTextController.text));
    return processResponse;
  }



}
