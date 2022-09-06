import 'package:database_app/api/controllers/users_api_controller.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  late TextEditingController _phoneTextController;
  late TextEditingController _passwordTextController;
  bool _obsecure = true;
  late String _language;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _language =
        SharedPrefController().getValueFor<String>(PrefKeys.language.name) ??
            'en';
    _phoneTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,   //new line

      appBar: AppBar(
        // title: Text(AppLocalizations.of(context)!.login),

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        context.localizations.project_name,
                        style: GoogleFonts.nunito(

                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 51.3.h,
            ),

            // Text(
            //   AppLocalizations.of(context)!.login_sub_title,
            //   style: GoogleFonts.poppins(
            //       fontSize: 16.sp,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black45),
            // ),
            Text(
              context.localizations.login_title, style: GoogleFonts.nunito(fontSize: 16.sp, color: const Color(0xff3E3E3E).withOpacity(0.6) ,fontWeight: FontWeight.w400 ),
            ),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
                hint:  context.localizations.phone_num,
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.phone,
                controller: _phoneTextController),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
                hint: context.localizations.password,
                obscureText: _obsecure,
                prefixIcon: Icons.lock,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => _obsecure = !_obsecure);
                    },
                    // Icons.visibility
                    icon:  Icon(_obsecure ? Icons.visibility : Icons.visibility_off )),
                keyboardType: TextInputType.text,
                controller: _passwordTextController),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child:  Text(context.localizations.forgot_pass +'?'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot_password_screen');
                  },
                  style: TextButton.styleFrom(primary: const Color(0xffFF7750)),
                )
              ],
            ),
           const Spacer(),
            ElevatedButton(
                onPressed: () {
                  // print(_emailTextController.text);
                  // print(_passwordTextController.text);
                  // Navigator.pushReplacementNamed(context, '/home_screen');
                  _performLogin();
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(325.w, 63.83.h),
                    primary: Color(0xffFF7750),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r))),
                child: Text(
                  context.localizations.login,
                  style: GoogleFonts.nunito(fontSize: 16.sp ,color: Color(0xffFFFFFF) ,fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 20.2.h,
            ),

            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.localizations.new_account_message  ,style: GoogleFonts.nunito(color: Color(0xFF707070) ,fontSize: 14)  ),
                TextButton(

                  onPressed: () =>
                      Navigator.pushNamed(context, '/register_screen'),
                  child: Text(context.localizations.sign_up,style: GoogleFonts.nunito(color: Color(0xFFFF7750) ,fontSize: 14)),
                  style: TextButton.styleFrom(primary: Color(0xffF3651F)),
                )
              ],
            ),
            SizedBox(height: 50.h,),
          ],
        ),
      ),
    );
  }


  void _performLogin() {
    if (_checkData()) {
      _login();
    }
  }

  bool _checkData() {
    if (_phoneTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar( message: 'Enter Required Data!', error: true);
    return false;
  }

  void _login() async {
    ProcessResponse processResponse = await UsersApiController().login(
        mobile: _phoneTextController.text, password: _passwordTextController.text);
    // print(processResponse.success);
    if(processResponse.success){
      Navigator.pushReplacementNamed(context, '/home_screen');

    }
    context.showSnackBar(message: processResponse.message ,error: !processResponse.success);
    }
}

class _buildLogin extends StatelessWidget {
  Image icon;
  Color color;

  _buildLogin({Key? key, required this.icon, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      child:icon,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
