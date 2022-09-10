import 'dart:convert';
import 'dart:io';

import '../../models/card.dart';
import '../../models/process_response.dart';
import '../../prefs/shared_pref_controller.dart';
import '../../utils/helpers.dart';
import '../api_settings.dart';
import 'package:http/http.dart' as http;

class PaymentApiController with Helpers{

  Future<ProcessResponse> createPaymentCard( {required String holder_name,
    required String card_number,
    required  String  exp_date,
    required String cvv,
    required String type,

  }) async {
    Uri uri = Uri.parse(ApiSettings.paymentcards);
    var response = await http.post(uri, headers: {
      HttpHeaders.authorizationHeader:
       SharedPrefController().getValueFor<String>(PrefKeys.token.name)!}, body: {
      'holder_name': holder_name,
      'card_number':card_number,
      'exp_date': exp_date,
      'cvv':cvv,
      'type':type,
    });
    print(response.body);
    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ProcessResponse(
          message: json['message'] ,success: json['status']);
    }
    return errorResponse;
  }
  //
  // Future<List<Card>> getAllCards() async {
  //   var response = await http.get(getUrl(ApiSettings.CARD), headers: requestHeaders);
  //   if (isSuccessRequest(response.statusCode)) {
  //     var data = jsonDecode(response.body)['list'] as List;
  //     List<MyCard> cards = data.map((e) => MyCard.fromJson(e)).toList();
  //     return cards;
  //   }
  //   return [];
  // }

  Future<List<Payment>> getAllCards() async {
    String token =SharedPrefController().getValueFor<String>( PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.paymentcards);
    var response = await http
        .get(uri, headers: {HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader : token,
    });
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var jsonDataObject = json['list'] as List;
      var cards= jsonDataObject.map((jsonObject) => Payment.fromJson(jsonObject))
          .toList();
      cards.where((element) => element.userId==SharedPrefController().getValueFor<String>(PrefKeys.token.name)!);
      return cards;
    }
    return [];
  }
  Future<ProcessResponse> deleteCard  ({required int id }) async {

    String token =SharedPrefController().getValueFor<String>( PrefKeys.token.name)!;

    Uri uri = Uri.parse(ApiSettings.paymentcards+'/$id');
    var response = await http.delete(uri,headers: {HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader : token});
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ProcessResponse(message: json['message'], success:true);
    }
    return errorResponse;
  }











}