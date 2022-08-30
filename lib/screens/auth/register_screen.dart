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
import '../../models/city.dart';
import '../../provider/language_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helpers {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _nameTextController;
  late TextEditingController _mobileTextController;
  late TextEditingController _cityTextController;
  final List<City> _cities = <City>[
    const City(id: 1, title: 'Gaza'),
    const City(id: 2, title: 'BeitLahia'),
    const City(id: 3, title: 'Khanyounis'),
  ];

  bool _obsecure = true;
  late String? _gender;
  late int? _selectedCityId =1 ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _mobileTextController = TextEditingController();
    _cityTextController = TextEditingController();
    _gender = 'M';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _nameTextController.dispose();
    _mobileTextController.dispose();
    _cityTextController.dispose();
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
              'Create Your Account',
              style: GoogleFonts.nunito(
                  fontSize: 22.sp,
                  color: const Color(0xff3E3E3E),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.h,
            ),
            AppTextField(
                hint: 'Full Name',
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
                controller: _nameTextController),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
                hint: 'Mobile',
                prefixIcon: Icons.phone_android,
                keyboardType: TextInputType.number,
                controller: _mobileTextController),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
                hint: 'Password',
                obscureText: _obsecure,
                prefixIcon: Icons.lock,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => _obsecure = !_obsecure);
                    },
                    // Icons.visibility
                    icon: Icon(
                        _obsecure ? Icons.visibility : Icons.visibility_off)),
                keyboardType: TextInputType.text,
                controller: _passwordTextController),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Gender',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                      title: Text(
                        'Male',
                        style: GoogleFonts.nunito(),
                      ),
                      value: 'M',
                      activeColor: Color(0xffFF7750),
                      groupValue: _gender,
                      onChanged: (String? value) {
                        setState(() => _gender = value);
                      }),
                ),
                Expanded(
                  child: RadioListTile<String>(
                      title: Text(
                        'Female',
                        style: GoogleFonts.nunito(),
                      ),
                      value: 'F',
                      activeColor: Color(0xffFF7750),
                      groupValue: _gender,
                      onChanged: (String? value) {
                        setState(() => _gender = value);
                      }),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'City',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            DropdownButton<int>(
                isExpanded: true,
                hint: Text('Select City' ,style:GoogleFonts.nunito(fontSize: 16.sp ,fontWeight:FontWeight.w400 , color:Color(0xFFCACACA)) ,) ,

                value: _selectedCityId ,
                selectedItemBuilder: (BuildContext context){
                  return
                  _selectedCityId != null ?
                  _cities.map((city) => DropdownMenuItem<int>(
                    child: Text(_cities.firstWhere((element) => element.id == _selectedCityId ).title),
                    value: city.id,
                  )).toList()   : [];

                },
                items: _cities
                    .map((city) => DropdownMenuItem<int>(
                          child: Text(city.title),
                          value: city.id,
                        ))
                    .toList(),
                onChanged: (int? value) {
                  setState(()=> _selectedCityId =value);


                }),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'verification_screen');
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(325.w, 63.83.h),
                    primary: Color(0xffFF7750),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r))),
                child: Text(
                  'Continue',
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
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  },
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
}
