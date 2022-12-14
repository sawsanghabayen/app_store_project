import 'package:database_app/models/process_response.dart';
import 'package:database_app/screens/app/address/addresses_screen.dart';
import 'package:database_app/screens/app/home_screen.dart';
import 'package:database_app/screens/widgets/app_text_field.dart';
import 'package:database_app/utils/context_extension.dart';
import 'package:database_app/widgets/app_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../getx/address_getx_controller.dart';
import '../../../models/city.dart';
import '../../../prefs/shared_pref_controller.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({Key? key}) : super(key: key);

  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  late TextEditingController _cityTextController;
  late TextEditingController _addressTextController;
  late TextEditingController _infoTextController;
  late TextEditingController _phoneTextController;
  AddressGetxController controller = Get.put(AddressGetxController());

  late int? _selectedCityId = 1;

  @override
  void initState() {
    super.initState();
    _cityTextController = TextEditingController();
    _addressTextController = TextEditingController();
    _infoTextController = TextEditingController();
    _phoneTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _cityTextController.dispose();
    _addressTextController.dispose();
    _infoTextController.dispose();
    _phoneTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: AppText(
          text: 'Add new Address',
          fontSize: 17.sp,
          color: Color(0xFF222B45),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              text: 'Your City',
              fontSize: 13.sp,
              color: Color(0xFF8992A3),
            ),
            SizedBox(
              height: 15.h,
            ),

            Container(
                // child: DropdownButtonFormField<int>(
                //   decoration: InputDecoration(
                //
                //     enabledBorder: OutlineInputBorder( //<-- SEE HERE
                //       borderSide: BorderSide(color: Color(0xFFEDF1F7), width: 2,),
                //       borderRadius: BorderRadius.circular(50.0),
                //     ),
                //     focusedBorder: OutlineInputBorder( //<-- SEE HERE
                //       borderSide: BorderSide(color: Color(0xFFFF7750), width: 2),
                //       borderRadius: BorderRadius.circular(50.0),
                //     ),
                //   ),
                //   // style: BorderRadius(),
                //     hint: Text('Select City' ,style:GoogleFonts.nunito(fontSize: 16.sp ,fontWeight:FontWeight.w400 , color:Color(0xFFCACACA)) ,) ,
                //
                //     value: _selectedCityId ,
                //     selectedItemBuilder: (BuildContext context){
                //       return
                //         _selectedCityId != null ?
                //         controller.cities.map((city) => DropdownMenuItem<int>(
                //           child: Text(controller.cities.firstWhere((element) => element.id == _selectedCityId ).nameEn!),
                //           value: city.id,
                //         )).toList()   : [];
                //
                //     },
                //     items: controller.cities.map((city) => DropdownMenuItem<int>(
                //       child: Text(city.nameEn!),
                //       value: city.id,
                //     ))
                //         .toList(),
                //     onChanged: (int? value) {
                //       setState(()=> _selectedCityId =value);
                //
                //
                //     }),
                ),
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

            SizedBox(
              height: 20.h,
            ),
            AppText(
              text: 'Address',
              fontSize: 13.sp,
              color: Color(0xFF8992A3),
            ),
            SizedBox(
              height: 15.h,
            ),
            TextField(
              autofocus: true,
              controller: _addressTextController,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.h),
                hintText: 'Type your location or use pin',
                hintStyle: GoogleFonts.nunito(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFCACACA)),
                hintMaxLines: 1,
                // prefixIcon: Icon(prefixIcon),
                suffixIcon: Icon(Icons.location_pin),
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
              height: 20.h,
            ),
            AppText(
              text: 'Phone Number',
              fontSize: 13.sp,
              color: Color(0xFF8992A3),
            ),
            SizedBox(
              height: 15.h,
            ),
            TextField(
              autofocus: true,
              controller: _phoneTextController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.h),
                hintText: '+1(234)06 007 888',

                hintStyle: GoogleFonts.nunito(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFCACACA)),
                hintMaxLines: 1,
                // prefixIcon: Icon(prefixIcon),
                suffixIcon: Icon(Icons.call),
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
              height: 20.h,
            ),
            AppText(
              text: 'Info',
              fontSize: 13.sp,
              color: Color(0xFF8992A3),
            ),
            SizedBox(
              height: 15.h,
            ),
            TextField(
              autofocus: true,
              controller: _infoTextController,
              // keyboardType:mapEquals(a, b) ,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.h),
                hintText: 'brief description for the street and building',
                hintStyle: GoogleFonts.nunito(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFCACACA)),
                hintMaxLines: 1,
                // prefixIcon: Icon(prefixIcon),
                // suffixIcon: Icon(Icons.place) ,
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
            // AppTextField(hint: 'Type your location or use pin', prefixIcon: prefixIcon, keyboardType: keyboardType, controller: controller)
            Spacer(),
            ElevatedButton(
                onPressed: () async{
                  // print('sdas');
                  ProcessResponse process=await    AddressGetxController.to.createAddress(
                      _addressTextController.text,
                      _infoTextController.text,
                      _phoneTextController.text,
                      int.parse(_selectedCityId.toString()
                      )
                  );
                  context.showSnackBar(message: process.message,error: !process.success);
                  // Navigator.pop(context);
                  Get.off(AddressesScreen());
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(325.w, 63.83.h),
                    primary: Color(0xffFF7750),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r))),
                child: Text(
                  'Save your address',
                  style: GoogleFonts.nunito(
                      fontSize: 16.sp,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
