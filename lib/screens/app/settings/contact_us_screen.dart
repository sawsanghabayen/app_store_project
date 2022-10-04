import 'package:database_app/screens/widgets/app_text_field.dart';
import 'package:database_app/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../api/controllers/contact_api_controller.dart';
import '../../../models/process_response.dart';
import '../../../widgets/app_text.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key );

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  late TextEditingController _subjectTextController;
  late TextEditingController _messageTextController;

  @override
  void initState() {
    super.initState();
    _subjectTextController = TextEditingController();
    _messageTextController = TextEditingController();

  }
  @override
  void dispose() {
    _subjectTextController.dispose();
    _messageTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,   //new line
      backgroundColor: Color(0xffF4F5F7),

      // backgroundColor: Color(0xffF4F5F7),
      appBar: AppBar(
        title: AppText(
        text: 'Contact Us',
        fontSize: 17.sp,
        color: Color(0xFF222B45),
    ),
    ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.w ,),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

            children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xffF4F5F7)),
                borderRadius: BorderRadius.circular(15.r),
              color: Colors.white,


            ),
            height: 500.h,
            width:double.infinity,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                AppText(text: 'Get in touch', fontSize: 24.sp,
                  color: Color(0xFF3E3E3E),
                  fontWeight: FontWeight.bold,) ,
                // SizedBox(height: 15.h,),
                TextField(
                  autofocus: true,
                  controller: _subjectTextController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 14.w, vertical: 15.h),
                    prefixIcon: Icon(Icons.message),
                    hintText: 'Subject',
                    hintStyle: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFCACACA)),
                    hintMaxLines: 1,
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
                TextField(
                  minLines: 5,
                  maxLines: 5,

                  autofocus: true,
                  controller: _messageTextController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 14.w, vertical: 15.h),

                    // prefixIcon: Icon(Icons.message ,),
                    hintText: 'Type Your Message...',
                    hintStyle: GoogleFonts.nunito(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFCACACA)),


                    hintMaxLines: 5,
                    // prefixIcon: Icon(prefixIcon),
                    // suffixIcon: Icon(Icons.) ,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(color: Color(0xFFEDF1F7)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(color: Color(0xFFFF7750)),
                    ),
                  ),
                ),
                    ElevatedButton(
                        onPressed: () {
                          _performContact();

                          Navigator.pushReplacementNamed(context, '/');
                          // _performLogin();
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(100.w, 40.h),
                            primary: Color(0xffFF7750),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r))),
                        child: Text(
                          'Send',
                          style: GoogleFonts.nunito(fontSize: 16.sp ,color: Color(0xffFFFFFF) ,fontWeight: FontWeight.bold),
                        )),


                    // AppTextField(hint: 'name', prefixIcon: Icons.person, keyboardType: TextInputType.text, controller: _nameTextController)


              ]),
            ),
          ),
              SizedBox(height: 50.h,),

        ]),
      ),

    );
  }


  void _performContact() {
    if (_checkData()) {
      _contact();
    }
  }
  bool _checkData() {
    if (_subjectTextController.text.isNotEmpty &&_messageTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar( message: 'Enter Required Data!', error: true);
    return false;
  }

  void _contact() async {

    ProcessResponse processResponse =await ContactApiController().contact(subject: _subjectTextController.text
        , message: _messageTextController.text);
    if(processResponse.success){
      Navigator.pop(context);
      context.showSnackBar(message: processResponse.message ,error: !processResponse.success);

    }
  }
}
