import 'package:database_app/utils/context_extension.dart';
import 'package:database_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../getx/card_getx_controller.dart';
import '../../../models/payment_cards.dart';
import '../../../models/process_response.dart';

class NewPaymentsScreen extends StatefulWidget {
  const NewPaymentsScreen({Key? key}) : super(key: key);

  @override
  State<NewPaymentsScreen> createState() => _NewPaymentsScreenState();
}

class _NewPaymentsScreenState extends State<NewPaymentsScreen> {
  CardGetxController controller = Get.put(CardGetxController());

  late PageController _pageController;

  late TextEditingController _cardNumTextController;
  late TextEditingController _cardTypeTextController;
  late TextEditingController _expirationTextController;
  late TextEditingController _holderNameTextController;
  late TextEditingController _cvvTextController;

  DateTime _date = DateTime.now();

  // final List<PaymentCards> _paymentcards = <PaymentCards>[
  //   const PaymentCards(id: 1, title: 'PayPal'),
  //   const PaymentCards(id: 2, title: 'Visa'),
  //   const PaymentCards(id: 3, title: 'Master Card'),
  // ];
  // late int? _selectedCityId = 1;
  String _typeCard = 'Visa';

  @override
  void initState() {
    // TODO: implement initState
    SchedulerBinding.instance.addPostFrameCallback((_) {
      controller.getAllCards();


    });
    super.initState();
    _cardNumTextController = TextEditingController();
    _expirationTextController = TextEditingController();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);

    _holderNameTextController = TextEditingController();
    _cvvTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _cardNumTextController = TextEditingController();
    _expirationTextController = TextEditingController();
    _holderNameTextController = TextEditingController();
    _cvvTextController = TextEditingController();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        title: AppText(
          text: 'Payment Cards',
          fontSize: 20.sp,
          color: Color(0xFF3E3E3E),
          fontWeight: FontWeight.bold,
        ),
      ),
      body:
      GetX<CardGetxController>(
        builder: (controller) {
          return controller.loading.value
              ? Center(child: CircularProgressIndicator())
              :

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Color(0xFFFFFFFF),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.w, vertical: 18.h),
                    child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                              text: 'Add new Payment Method',
                              fontSize: 17.sp,
                              color: Color(0xFF222B45)),
                          SizedBox(height: 20.h,),
                          // DropdownButtonFormField<int>(
                          //     decoration: InputDecoration(
                          //       enabledBorder: OutlineInputBorder(
                          //         //<-- SEE HERE
                          //         borderSide: BorderSide(
                          //           color: Color(0xFFEDF1F7),
                          //           width: 2,
                          //         ),
                          //         borderRadius: BorderRadius.circular(50.0),
                          //       ),
                          //       focusedBorder: OutlineInputBorder(
                          //         //<-- SEE HERE
                          //         borderSide: BorderSide(
                          //             color: Color(0xFFFF7750), width: 2),
                          //         borderRadius: BorderRadius.circular(50.0),
                          //       ),
                          //     ),
                          //     // style: BorderRadius(),
                          //     hint: Text(
                          //       'Select Payment Card',
                          //       style: GoogleFonts.nunito(
                          //           fontSize: 16.sp,
                          //           fontWeight: FontWeight.w400,
                          //           color: Color(0xFFCACACA)),
                          //     ),
                          //     value: _selectedCityId,
                          //     selectedItemBuilder: (BuildContext context) {
                          //       return _selectedCityId != null
                          //           ? _paymentcards
                          //               .map((city) => DropdownMenuItem<int>(
                          //                     child: Text(_paymentcards
                          //                         .firstWhere((element) =>
                          //                             element.id == _selectedCityId)
                          //                         .title),
                          //                     value: city.id,
                          //                   ))
                          //               .toList()
                          //           : [];
                          //     },
                          //     items: _paymentcards
                          //         .map((city) => DropdownMenuItem<int>(
                          //               child: Text(city.title),
                          //               value: city.id,
                          //             ))
                          //         .toList(),
                          //     onChanged: (int? value) {
                          //       setState(() => _selectedCityId = value);
                          //     }),

                          TextField(
                            autofocus: true,
                            controller: _cardNumTextController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 15.h),
                              hintText: 'Card Number',
                              hintStyle: GoogleFonts.nunito(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFCACACA)),
                              hintMaxLines: 1,
                              // prefixIcon: Icon(prefixIcon),
                              // suffixIcon: Icon(Icons.) ,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.r),
                                borderSide: BorderSide(
                                    color: Color(0xFFEDF1F7)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.r),
                                borderSide: BorderSide(
                                    color: Color(0xFFFF7750)),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h,),

                          TextField(
                            autofocus: true,
                            controller: _holderNameTextController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 15.h),
                              hintText: 'Holder Name',
                              hintStyle: GoogleFonts.nunito(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFCACACA)),
                              hintMaxLines: 1,
                              // prefixIcon: Icon(prefixIcon),
                              // suffixIcon: Icon(Icons.) ,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.r),
                                borderSide: BorderSide(
                                    color: Color(0xFFEDF1F7)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.r),
                                borderSide: BorderSide(
                                    color: Color(0xFFFF7750)),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h,),

                          Row(
                            children: [
                              SizedBox(
                                width: 150.w,
                                child: TextField(
                                  autofocus: true,
                                  controller: _cvvTextController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 14.w, vertical: 15.h),
                                    hintText: 'CVV',
                                    hintStyle: GoogleFonts.nunito(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFCACACA)),
                                    hintMaxLines: 1,
                                    // prefixIcon: Icon(prefixIcon),
                                    // suffixIcon: Icon(Icons.) ,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.r),
                                      borderSide:
                                      BorderSide(color: Color(0xFFEDF1F7)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.r),
                                      borderSide:
                                      BorderSide(color: Color(0xFFFF7750)),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                  width: 150.w,
                                  child: GestureDetector(
                                    onTap: () {
                                      _selectDate();
                                    },
                                    child: Container(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(
                                              color: Colors.grey,
                                              text: DateFormat('yyyy-MM-dd')
                                                  .format(_date),
                                              fontSize: 14.sp),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.date_range,
                                                  color: Colors.grey))
                                        ],
                                      ),

                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border:
                                        Border.all(color: Color(0xffEDF1F7)),
                                        borderRadius: BorderRadius.circular(
                                            15.r),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(height: 20.h,),

                          Text(
                            context.localizations.type_card,
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.normal,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(height: 20.h,),

                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile<String>(
                                    title: Text(
                                      context.localizations.visa,
                                      style: GoogleFonts.nunito(),
                                    ),
                                    value: 'Visa',
                                    activeColor: Color(0xffFF7750),
                                    groupValue: _typeCard,
                                    onChanged: (String? value) {
                                      setState(() => _typeCard = value!);
                                    }),
                              ),
                              Expanded(
                                child: RadioListTile<String>(
                                    title: Text(
                                      context.localizations.master,
                                      style: GoogleFonts.nunito(),
                                    ),
                                    value: 'Master',
                                    activeColor: Color(0xffFF7750),
                                    groupValue: _typeCard,
                                    onChanged: (String? value) {
                                      setState(() => _typeCard = value!);
                                    }),
                              ),
                            ],
                          ),
                         Spacer(),

                          ElevatedButton(

                              onPressed: () async {
                                // print('sdas');
                                ProcessResponse process = await CardGetxController
                                    .to.createCard(
                                    _holderNameTextController.text,
                                    _cardNumTextController.text,
                                    _expirationTextController.text,
                                    _cvvTextController.text, _typeCard);
                                if(process.success){
                                  clearText();
                                  Navigator.pushReplacementNamed(context, '/payments_cards_screen');
                                }
                                context.showSnackBar(message: process.message,
                                    error: !process.success);
                                // Navigator.pop(context);
                                // Get.off(AddressesScreen());
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(325.w, 50.h),
                                  primary: Color(0xffFF7750),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          16.r))),
                              child: Text(
                                'Save your Card',
                                style: GoogleFonts.nunito(
                                    fontSize: 16.sp,
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(height: 50.h,),

                          // SizedBox()
                        ]),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      initialDate: _date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      context: context,
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        _expirationTextController.text = formattedDate;
        _date = pickedDate;
        // DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void clearText() {
    _holderNameTextController.clear();
    _cardNumTextController.clear();
    _expirationTextController.clear();
    _cvvTextController.clear();
  }
}
//