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
import '../../api/controllers/users_api_controller.dart';
import '../../getx/language_getx_controller.dart';
import '../../widgets/app_text.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> with Helpers {
  late TextEditingController _mobileTextController;
  late TextEditingController _codeTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _password_confirmationTextController;
  bool _obsecure = true;
  bool _obsecurePass2 = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileTextController = TextEditingController();
    _codeTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _password_confirmationTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mobileTextController.dispose();
    _codeTextController.dispose();
    _passwordTextController.dispose();
    _password_confirmationTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Reset Password',
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
              'Reset Password',
              style: GoogleFonts.nunito(
                  fontSize: 22.sp,
                  color: Color(0xFF3E3E3E),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Set the new password for your account and you can access all the features',
              style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  color: const Color(0xff3E3E3E).withOpacity(0.6),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 30.h,
            ),
            AppTextField(
                hint: 'Enter your mobile',
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.phone,
                controller: _mobileTextController),
            SizedBox(
              height: 30.h,
            ),
            AppTextField(
                hint: 'Enter code',
                prefixIcon: Icons.qr_code,
                keyboardType: TextInputType.text,
                controller: _codeTextController),
            SizedBox(
              height: 30.h,
            ),
            AppTextField(
                hint: 'new password',
                obscureText: _obsecure,
                prefixIcon: Icons.lock,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => _obsecure = !_obsecure);
                    },

                    icon: Icon(
                        _obsecure ? Icons.visibility : Icons.visibility_off)),
                keyboardType: TextInputType.text,
                controller: _passwordTextController),

            SizedBox(
              height: 20.h,
            ),
            AppTextField(
                hint: 'Repeat password',
                obscureText: _obsecurePass2,
                prefixIcon: Icons.lock,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => _obsecurePass2 = !_obsecurePass2);
                    },
                    // Icons.visibility
                    icon: Icon(_obsecurePass2 ? Icons.visibility : Icons
                        .visibility_off)
                ),
                keyboardType: TextInputType.text,
                controller: _password_confirmationTextController),
// 7623
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  print('sasa');
                  _performResetPassword();
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(325.w, 63.83.h),
                    primary: Color(0xffFF7750),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r))),
                child: Text(
                  'Confirm',
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

  void _performResetPassword() {
    if (_checkData()) {
      _resetPassword();
    }
  }


  bool _checkData() {
    if (_mobileTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty
        && _password_confirmationTextController.text.isNotEmpty &&
        _codeTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter Required Data!', error: true);
    return false;
  }

  void _resetPassword() async {
    print(_codeTextController.text);
    ProcessResponse processResponse = await UsersApiController().resetPassword(
        mobile: int.parse(_mobileTextController.text)
        ,
        password: int.parse(_passwordTextController.text),
        code:  int.parse(_codeTextController.text),
        password_confirmation: int.parse(
            _password_confirmationTextController.text));
    if (processResponse.success) {
      Navigator.pop(context);
    }
      context.showSnackBar(
          message: processResponse.message, error: !processResponse.success);
  }


// class ShowSuccess extends StatelessWidget {
//   final String text;
//   final String subText;
//   const ShowSuccess({
//     Key? key,
//    required this.text,
//    required this.subText
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       // titlePadding: ,
//       shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
//       title: Column(
//         children:[
//           SizedBox(height: 20.h,),
//           Icon(Icons.check_circle ,size: 58, color:Colors.green,),
//           SizedBox(height: 20.h,),
//           Text(
//           text,
//           style: GoogleFonts.nunito( fontSize: 17, color: Color(0xFF3E3E3E), fontWeight: FontWeight.bold ,),
//           textAlign:TextAlign.center,
//         ),
//           SizedBox(height: 10.h,),
//           TextButton(
//               onPressed: (){
//                 Navigator.pop(context ,true);
//                 // Navigator.pushReplacementNamed(context, '/login_screen');
//
//
//               }, child: Text(subText,style: GoogleFonts.nunito(fontSize: 14, color: Color(0xFFCACACA) ,fontWeight: FontWeight.normal),)),
//           SizedBox(height: 20.h,),
//
//
//
//         ]
//       ),
//
//     );
//   }
// }
}