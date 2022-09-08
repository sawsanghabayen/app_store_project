

import 'dart:convert';
import 'dart:io';

import 'package:database_app/models/cart.dart';

import '../../models/order.dart';
import '../../models/order_details.dart';
import '../../models/process_response.dart';
import '../../prefs/shared_pref_controller.dart';
import '../../utils/helpers.dart';
import '../api_settings.dart';
import 'package:http/http.dart' as http;


class OrderApiController with Helpers{
  Future<ProcessResponse> createOrder({
    required List<Map<String,dynamic>> cartItems,
    required String paymentType,
    required int addressId,
         }) async {
    print(cartItems);
    String token =SharedPrefController().getValueFor<String>( PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.order);
    var response = await http.post(uri, body: {
      'cart': jsonEncode(cartItems),
      'payment_type': paymentType,
      'address_id': addressId.toString()
    },headers: {
      HttpHeaders.authorizationHeader : token,
      HttpHeaders.acceptHeader:'application/json'
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);

      return ProcessResponse(message: json['message'], success: json['status']);
    }

    return errorResponse;
  }


  Future<List<Order>> getAllOrders() async {
    Uri uri = Uri.parse(ApiSettings.order);
    var response = await http
        .get(uri, headers: {HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!});
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var jsonDataObject = json['list'] as List;
      return jsonDataObject.map((jsonObject) => Order.fromJson(jsonObject)).toList();
    }
    return [];

  }
  Future<OrderDetails?> getOrderDetails({required int id}) async {
    var response = await http.get(Uri.parse(ApiSettings.order+'/$id'),headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
      'X-Requested-With': 'XMLHttpRequest',
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      OrderDetails orderDetails = OrderDetails.fromJson(jsonDecode(response.body)['data']);
      return orderDetails;
    }
    return null;
  }



}