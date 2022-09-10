import 'package:database_app/utils/context_extension.dart';
import 'package:database_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/controllers/users_api_controller.dart';
import '../../getx/address_getx_controller.dart';
import '../../models/city.dart';
import '../../models/process_response.dart';
import '../../prefs/shared_pref_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameTextController;
  late TextEditingController _cityTextController;
  AddressGetxController controller = Get.put(AddressGetxController());

  // final List<City> _cities = <City>[
  //   const City(id: 1, title: 'Gaza'),
  //   const City(id: 2, title: 'BeitLahia'),
  //   const City(id: 3, title: 'Khanyounis'),
  // ];
  late String _gender =  SharedPrefController().getValueFor<String>(PrefKeys.gender.name)!;

  late int? _selectedCityId = int.parse(SharedPrefController().getValueFor<String>(PrefKeys.city_id.name)!);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController(text: SharedPrefController().getValueFor<String>(PrefKeys.name.name)!);
    _cityTextController = TextEditingController(text: _selectedCityId.toString());
    _gender = SharedPrefController().getValueFor<String>(PrefKeys.gender.name)!;
    // _nameTextController.text = SharedPrefController().getValueFor<String>(PrefKeys.name.name)!;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextController.dispose();
    _cityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: AppText(
          text: 'Edit Profile',
          fontSize: 17.sp,
          color: Color(0xFF222B45),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppText(
            text: 'Edit Profile',
            fontSize: 20.sp,
            color: Color(0xFF3E3E3E),
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
              child: Stack(
            children: [
              Container(
                width: 120.w,
                height: 120.h,
                // color: Colors.red,
                child: CircleAvatar(
                  radius: 50.r,
                  // backgroundColor: Color(0xFFFF7750),
                  backgroundImage: AssetImage('images/avatar.png'),
                ),
              ),
              Positioned(
                bottom: 2.h,
                right: 2.w,
                child: CircleAvatar(child: Icon(Icons.mode_edit_outline_outlined ,color: Colors.white,) ,radius: 20.r,backgroundColor: Color(0xFFFF7750),),
              )
            ],
          )),
          SizedBox(
            height: 30.h,
          ),
          TextField(
            autofocus: true,
            controller: _nameTextController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.h),

              hintMaxLines: 5,
              // prefixIcon: Icon(prefixIcon),
              // suffixIcon: Icon(Icons.) ,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide(color: Color(0xFFEDF1F7)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide(color: Color(0xFFFF7750)),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
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
            height: 30.h,
          ),
          AppText(
            text: 'Gender',
            fontSize: 18.sp,
            color: Color(0xFF3E3E3E),
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
                      setState(() => _gender = value!);
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
                      setState(() => _gender = value!);
                    }),
              ),
            ],
          ),
          Spacer(),
          ElevatedButton(
              onPressed: () {

                _performChangeProfile();
                // Navigator.pushReplacementNamed(context, '/home_screen');
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(325.w, 63.83.h),
                  primary: Color(0xffFF7750),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r))),
              child: Text(
                'Save Changes',
                style: GoogleFonts.nunito(fontSize: 16.sp ,color: Color(0xffFFFFFF) ,fontWeight: FontWeight.bold),
              )),
          SizedBox(height: 20.h,),

        ]),
      ),
    );
  }

  void _performChangeProfile() {
    if (_checkData()) {
      _register();
    }
  }

  bool _checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _cityTextController.text.isNotEmpty && _gender.isNotEmpty ) {
      return true;
    }
    context.showSnackBar( message: 'Enter Required Data!', error: true);
    return false;
  }

  void _register() async {
    ProcessResponse processResponse =await UsersApiController().updateProfile(name: _nameTextController.text, gender: _gender, city_id: _cityTextController.text);
    if(processResponse.success){
      // Navigator.pop(context);

    }
      context.showSnackBar(message: processResponse.message ,error: !processResponse.success);
  }






}
