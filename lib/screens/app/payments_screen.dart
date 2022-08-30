import 'package:database_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../models/payment_cards.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  late PageController _pageController;

  late TextEditingController _cardNumTextController;
  late TextEditingController _expirationTextController;
  late TextEditingController _holderNameTextController;
  late TextEditingController _cvvTextController;

  DateTime _date = DateTime.now();

  final List<PaymentCards> _paymentcards = <PaymentCards>[
    const PaymentCards(id: 1, title: 'PayPal'),
    const PaymentCards(id: 2, title: 'Visa'),
    const PaymentCards(id: 3, title: 'Master Card'),
  ];
  late int? _selectedCityId = 1;

  @override
  void initState() {
    // TODO: implement initState

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            // child: Container(
            //   // width: 327.w,
            //   height: 161.47.h,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(16.r),
            //     color: Color(0xFFFFFFFF),
            //   ),
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         AppText(
            //             text: 'Payment Method',
            //             fontSize: 18.sp,
            //             color: Color(0xFF36596A)),
            //         SizedBox(
            //           height: 17.h,
            //         ),
            //         Expanded(
            //           child: ListView.builder(
            //             scrollDirection: Axis.horizontal,
            //             // shrinkWrap: true,
            //             itemCount: 10,
            //             itemBuilder: (context, index) {
            //               return Padding(
            //                 padding: EdgeInsets.only(bottom: 16.h),
            //                 child: Container(
            //                   height: 161.h,
            //                   width: 295,
            //                   decoration: BoxDecoration(
            //                       border: Border.all(color: Color(0xFFF4F5F7)),
            //                       borderRadius: BorderRadius.circular(17.64.r),
            //                       color: Color(0xFF707070)),
            //                   child: Padding(
            //                     padding: EdgeInsets.symmetric(
            //                         horizontal: 12.w, vertical: 12.h),
            //                     child: Row(children: [
            //                       Image(image: AssetImage('images/visa.png')),
            //                       Column(children: [
            //                         // AppText(text: 'text', fontSize: fontSize, color: color)
            //                       ]),
            //                     ]),
            //                   ),
            //                 ),
            //               );
            //             },
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            //
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 20.w,
            //     vertical: 20.h,
            //   ),
            child: MediaQuery.removePadding(
              context: context,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(7.8),
                    height: 161.21.h,
                    width: 295.55.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black87,
                            Colors.black45,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.25),
                              offset: Offset(0, 15),
                              blurRadius: 45)
                        ]),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('**  **  **  **',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.paypal,
                                      color: Colors.blue,
                                      size: 30,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('\$2,500',
                                    style: TextStyle(
                                        fontSize: 36.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text('balance',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.grey[400])),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Color(0xFFFFFFFF),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                          text: 'Add new Payment Method',
                          fontSize: 17.sp,
                          color: Color(0xFF222B45)),
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
                              borderSide: BorderSide(
                                  color: Color(0xFFFF7750), width: 2),
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
                                ? _paymentcards
                                    .map((city) => DropdownMenuItem<int>(
                                          child: Text(_paymentcards
                                              .firstWhere((element) =>
                                                  element.id == _selectedCityId)
                                              .title),
                                          value: city.id,
                                        ))
                                    .toList()
                                : [];
                          },
                          items: _paymentcards
                              .map((city) => DropdownMenuItem<int>(
                                    child: Text(city.title),
                                    value: city.id,
                                  ))
                              .toList(),
                          onChanged: (int? value) {
                            setState(() => _selectedCityId = value);
                          }),
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
                            borderSide: BorderSide(color: Color(0xFFEDF1F7)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.r),
                            borderSide: BorderSide(color: Color(0xFFFF7750)),
                          ),
                        ),
                      ),
                      TextField(
                        autofocus: true,
                        controller: _cardNumTextController,
                        keyboardType: TextInputType.number,
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
                            borderSide: BorderSide(color: Color(0xFFEDF1F7)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.r),
                            borderSide: BorderSide(color: Color(0xFFFF7750)),
                          ),
                        ),
                      ),
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
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // Navigator.pushNamed(context, 'verification_screen');
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(325.w, 50.h),
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

                      // SizedBox()
                    ]),
              ),
            ),
          ),
        ],
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
}
