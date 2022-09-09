import 'package:database_app/api/controllers/users_api_controller.dart';
import 'package:database_app/database/controllers/user_db_controller.dart';
import 'package:database_app/models/process_response.dart';
import 'package:database_app/prefs/shared_pref_controller.dart';
import 'package:database_app/screens/widgets/app_text_field.dart';
import 'package:database_app/utils/context_extension.dart';
import 'package:database_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../getx/address_getx_controller.dart';
import '../../models/city.dart';
import '../../models/user.dart';
import '../../getx/language_getx_controller.dart';
import '../../widgets/app_text.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({Key? key}) : super(key: key);


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}


class _RegisterScreenState extends State<RegisterScreen> with Helpers {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _nameTextController;
  late TextEditingController _mobileTextController;
  late TextEditingController _cityTextController;
  AddressGetxController controller = Get.put(AddressGetxController());

  // late Future<List<City>> _cities;

  bool _obsecure = true;
   String _gender='M';
  // late int _selectedCityId ;
  late int? _selectedCityId = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // Future.delayed(Duration(seconds: 0),() {
   //   controller.getCities();
   // },);
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _mobileTextController = TextEditingController();
    _cityTextController = TextEditingController();
    // _gender = 'M';
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
      resizeToAvoidBottomInset: false, //new line

      appBar: AppBar(
        title: AppText(
          text: context.localizations.sign_up,
          fontSize: 17.sp,
          color: Color(0xFF222B45),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localizations.register_title,
              style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  color: const Color(0xff3E3E3E).withOpacity(0.6),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              context.localizations.register_sub_title,
              style: GoogleFonts.nunito(
                  fontSize: 22.sp,
                  color: const Color(0xff3E3E3E),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.h,
            ),
            AppTextField(
                hint: context.localizations.name,
                prefixIcon: Icons.person,
                keyboardType: TextInputType.text,
                controller: _nameTextController),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
                hint: context.localizations.mobile,
                prefixIcon: Icons.phone_android,
                keyboardType: TextInputType.number,
                controller: _mobileTextController),
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
                    icon: Icon(
                        _obsecure ? Icons.visibility : Icons.visibility_off)),
                keyboardType: TextInputType.text,
                controller: _passwordTextController),
            SizedBox(
              height: 20.h,
            ),
            Text(
              context.localizations.city,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.normal,
                fontSize: 18.sp,
              ),
            ),
            Container(
              child:
              DropdownButtonFormField<int>(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            //<-- SEE HERE
                            borderSide: BorderSide(
                              color: Color(0xFFEDF1F7),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            //<-- SEE HERE
                            borderSide: BorderSide(color: Color(0xFFFF7750), width: 2),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        // style: BorderRadius(),
                        hint: Text(
                          'Select City',
                          style: GoogleFonts.nunito(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFCACACA)),
                        ),
                        value: _selectedCityId,
                        selectedItemBuilder: (BuildContext context) {
                          return _selectedCityId != null
                              ? controller.cities
                              .map((city) => DropdownMenuItem<int>(
                            child: Text(SharedPrefController()
                                .getValueFor<String>('language') ==
                                'en'
                                ? controller.cities
                                .firstWhere((element) =>
                            element.id == _selectedCityId)
                                .nameEn!
                                : controller.cities
                                .firstWhere((element) =>
                            element.id == _selectedCityId)
                                .nameAr!),
                            value: city.id,
                          ))
                              .toList()
                              : [];
                        },
                        items: controller.cities
                            .map((city) => DropdownMenuItem<int>(
                          child: Text(SharedPrefController()
                              .getValueFor<String>('language') ==
                              'en'
                              ? city.nameEn!
                              : city.nameAr!),
                          value: city.id,
                        ))
                            .toList(),
                        onChanged: (int? value) {
                          setState(() => _selectedCityId = value);
                        }),
                    // return Text('');


              ),



            SizedBox(
              height: 20.h,
            ),
            Text(
              context.localizations.gender,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.normal,
                fontSize: 18.sp,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                      title: Text(
                        context.localizations.male,
                        style: GoogleFonts.nunito(),
                      ),
                      value: 'M',
                      activeColor: Color(0xffFF7750),
                      groupValue: _gender,
                      onChanged: (String? value) {
                        setState(() => _gender = value!);
                      }),
                ),
                Expanded(
                  child: RadioListTile<String>(
                      title: Text(
                        context.localizations.female,
                        style: GoogleFonts.nunito(),
                      ),
                      value: 'F',
                      activeColor: Color(0xffFF7750),
                      groupValue: _gender,
                      onChanged: (String? value) {
                        setState(() => _gender = value!);
                      }),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  _performRegister();
                  // Navigator.pushNamed(context, 'verification_screen');
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(325.w, 63.83.h),
                    primary: Color(0xffFF7750),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r))),
                child: Text(
                  context.localizations.sign_up,
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
                Text(context.localizations.new_account_message2,
                    style: GoogleFonts.nunito(
                        color: Color(0xFF707070), fontSize: 14)),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // context.showSnackBar(message: )
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  },
                  child: Text(context.localizations.sign_in,
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

  void _performRegister() {
    if (_checkData()) {
      _register();
    }
  }
  bool _checkData() {
    print(_passwordTextController.text);
    if (_passwordTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty && _nameTextController.text.isNotEmpty &&_mobileTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar( message: 'Enter Required Data!', error: true);
    return false;
  }

  void _register() async {
    ProcessResponse processResponse =await UsersApiController().register(user);
  if(processResponse.success){
    Navigator.pop(context);
    context.showSnackBar(message: processResponse.message ,error: !processResponse.success,seconde: 10);

  }
}

User get user {
  User user =User();
  user.name=_nameTextController.text;
  user.mobile=_mobileTextController.text;
  user.password=_passwordTextController.text;
  user.gender=_gender;
  user.cityId=_selectedCityId.toString();
  // user.=_gender;

  return user;
}
}
