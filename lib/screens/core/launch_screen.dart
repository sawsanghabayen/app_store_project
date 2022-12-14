import 'package:database_app/getx/address_getx_controller.dart';
import 'package:database_app/prefs/shared_pref_controller.dart';
import 'package:database_app/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}


class _LaunchScreenState extends State<LaunchScreen> {
  AddressGetxController controllerAddress = Get.put(AddressGetxController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerAddress.getCities();
    controllerAddress.getAddresses();
    Future.delayed(Duration(seconds:3),(){
      String route=SharedPrefController().getValueFor<bool>(PrefKeys.loggedIn.name) ?? false ?'/home_screen': '/on_boarding_screen';
      Navigator.pushReplacementNamed(context,route);

    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
         // decoration: BoxDecoration(
         //  gradient: LinearGradient(
         //      begin: AlignmentDirectional.centerStart,
         //      end: AlignmentDirectional.bottomEnd,
         //      colors: [Colors.pink.shade100, Colors.blue.shade100])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: const AssetImage('images/logo_2.png') ,width: 45.w, height: 45.h,),
              SizedBox(width: 20.w,),
              Text(context.localizations.project_name,style: GoogleFonts.nunito(fontWeight:FontWeight.bold ,fontSize: 28.sp ,color: Color(0xff3E3E3E)),),
            ],
          ),
    ));
  }
}
