import 'package:database_app/utils/context_extension.dart';
import 'package:database_app/widgets/app_text.dart';
import 'package:database_app/widgets/icon_with_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



import '../../../getx/card_getx_controller.dart';
import '../../../models/card.dart';
import '../../../models/process_response.dart';


class PaymentsCardsScreen extends StatefulWidget {
  PaymentsCardsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentsCardsScreen> createState() => _PaymentsCardsScreenState();
}

class _PaymentsCardsScreenState extends State<PaymentsCardsScreen> {
  CardGetxController controller=Get.put(CardGetxController());
  int indexCurrent=0;
  int i=0;

  @override
  void initState() {
    // TODO: implement initState
    SchedulerBinding.instance.addPostFrameCallback((_) {
      controller.getAllCards();


    });
    super.initState();
  }
  bool isPressed=false;
  @override
  Widget build(BuildContext context) {
    // Color borderColor =;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        title: AppText(
          text: 'Saved Payment Cards',
          fontSize: 17.sp,
          color: Color(0xFF222B45),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF7750),
        onPressed: () {
          Navigator.pushNamed(context, '/new_payments_screen');
        },
        child: Icon(Icons.add),
      ),
      body: GetX<CardGetxController>(
        builder: (controller) {
          return   controller.loading.value
              ? Center(child: CircularProgressIndicator())
              : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Stack(
                children: [
                  InkWell(
                    onTap: ()async{

                      // print(indexCurrent);
                      controller.addCard(getCashCard());
                      Navigator.pop(context,);

                      setState((){});


                    },
                    child: Container(
                        clipBehavior: Clip.antiAlias,

                      height: 161.21.h,
                      width: 295.55.w,
                      child:    Image(image:
                      const AssetImage('images/cash.jpg')
                        ,
                        fit:BoxFit.fill ,


                        width: double.infinity,
                        height: double.infinity,

                    ),
            decoration: BoxDecoration(
                    color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(
          15,
          ),)
                    ),
                  ),
                  Positioned(child: AppText(text:'Cash Payment' , color: Colors.black, fontSize: 20.sp, ),
                    top: 10.h,
                    left: 10.w,

                  ),
                ],
              ),
              Expanded(
                // flex: 13,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.card.value.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) async {
                          ProcessResponse process =
                          await controller.deleteCard(controller.card[index].id!);
                          context.showSnackBar(
                              message: process.message,
                              error: !process.success);
                        },
                        background: Container(color: Colors.red),
                        child: InkWell(
                          onTap:() async{
                        indexCurrent=index;
                        // print(indexCurrent);
                                  controller.addCard(controller.card.value[index]);
                          Navigator.pop(context,);

                        setState((){});

                        } ,
                          child: Container(
                            margin: EdgeInsets.all(7.8),
                        height: 161.21.h,
                        width: 295.55.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),

                            gradient: LinearGradient(

                              colors: [
                                controller.card[index].type=='Visa'? Color(0xff1b447b).withOpacity(1) :Colors.deepOrange,
                                controller.card[index].type=='Visa'? Color(0xff1b447b).withOpacity(0.97):Colors.deepOrangeAccent,
                                // Colors.black45,
                              ],
                            ),
                            // boxShadow: [
                            //   BoxShadow(
                            //       color: Colors.black.withOpacity(.25),
                            //       offset: Offset(0, 15),
                            //       blurRadius: 45)
                            // ]
                        ),
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
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(controller.card[index].cardNumber!.substring(0,4) +' '+
                                        controller.card[index].cardNumber!.substring(4,8)+' '+
                                        controller.card[index].cardNumber!.substring(8,12)+' '+
                                        controller.card[index].cardNumber!.substring(12,16),
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    Container(
                                        color: Colors.white,
                                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                                        child:
                                        controller.card[index].type=='Visa'?
                                        Image(image:
                                        const AssetImage('images/visa.png') ,
                                            width: 50.w, height: 30.h)
                                            :
                                        Image(image:  const AssetImage('images/mastercard.png') ,width: 50.w, height: 50.h)
                                    )


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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(controller.card[index].holderName!,
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.white)),

                                        Text(controller.card[index].cvv!.substring(0,1)+' '+controller.card[index].cvv!.substring(1,2)+' '+controller.card[index].cvv!.substring(2,3)+' '+controller.card[index].cvv!.substring(3,3),
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.grey[400])),


                                      ],
                                    ),
                                    SizedBox(height: 20.h,),
                                    Text(controller.card[index].expDate!,
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
                      ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },

      ),
    );
  }
  Payment getCashCard(){
    Payment cashCard = Payment();
    cashCard.type ='Cash';

    return cashCard;

}

// onContainerPressed(int index){
//   for(int i=0;i<controller.addresses.value.length; i++ ){
//     if(controller.addresses.value[index].){}
//   }
// }
}

