import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../api/api_settings.dart';
import '../api/controllers/payment_api_controller.dart';
import '../models/card.dart';
import '../models/process_response.dart';
import '../prefs/shared_pref_controller.dart';

class CardGetxController extends GetxController{

  PaymentApiController addressApiController = PaymentApiController();
  RxList<Payment> card = <Payment>[].obs;
  Rx<Payment> cardRx = Payment().obs;
  RxBool loading = false.obs;

  static CardGetxController get to => Get.find<CardGetxController>();

  void onInit() {
    getAllCards();
    super.onInit();
  }

  Future<ProcessResponse> createCard(String holder_name,
       String card_number,
        String  exp_date,
       String cvv,
       String type,) async {
    ProcessResponse processResponse = await PaymentApiController().createPaymentCard(holder_name: holder_name, card_number: card_number, exp_date: exp_date, cvv: cvv, type: type);
    return getResponse(
        processResponse.success, message: processResponse.message);
  }

  Future<void> getAllCards() async {
    loading.value = true;
    card.value = await PaymentApiController().getAllCards();
    loading.value = false;
    update();
  }


  Future<ProcessResponse> deleteCard(int index) async {
    loading = true.obs;
    // Address address = addresses[index];
    ProcessResponse processResponse = await PaymentApiController().deleteCard(id: index);
    loading.value = false;
    update();
    return processResponse;

  }

  void  addCard(Payment card){
    cardRx.value=card;
    update();
  }
  Payment selectedCard(){
    return cardRx.value;
  }


  ProcessResponse getResponse(bool success,
      {String message = 'Operation completed successfully'}) {
    return ProcessResponse(
      message: message,
      success: success,
    );
  }


}