import 'package:database_app/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}


class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds:3),(){
      // String route=SharedPrefController().getValueFor<bool>(PrefKeys.loggedIn.name) ?? false ?'/home_screen': '/login_screen';
      Navigator.pushReplacementNamed(context,'/on_boarding_screen');

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
              Text('SMART STORE',style: GoogleFonts.nunito(fontWeight:FontWeight.bold ,fontSize: 28.sp ,color: Color(0xff3E3E3E)),),
            ],
          ),
    ));
  }
}
