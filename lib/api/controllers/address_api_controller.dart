import 'dart:convert';
import 'dart:io';

import 'package:database_app/api/api_settings.dart';
import 'package:database_app/models/city.dart';
import 'package:database_app/models/user.dart';
import 'package:database_app/prefs/shared_pref_controller.dart';
import 'package:database_app/utils/helpers.dart';
import 'package:http/http.dart' as http;

import '../../models/address.dart';
import '../../models/home.dart';
import '../../models/process_response.dart';

class AddressApiController with Helpers {


  Future<ProcessResponse> createAddress({
    required String name ,
    required int cityId ,required String contactNumber ,required String  info
}) async {
    Uri uri = Uri.parse(ApiSettings.addresses);
    String token =SharedPrefController().getValueFor<String>( PrefKeys.token.name)!;

    var response = await http.post(uri, body: {
      'name': name,
      'info': info,
      'contact_number':contactNumber,
      'city_id': cityId.toString(),
    },headers: {
      HttpHeaders.authorizationHeader : token,
      HttpHeaders.acceptHeader:'application/json'
    });
    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);

      return ProcessResponse(message: json['message'], success: json['status']);
    }

    return errorResponse;
  }

  Future<List<Address>> getAddresses() async {
    String token =SharedPrefController().getValueFor<String>( PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.addresses);
    var response = await http
        .get(uri, headers: {HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader : token,
    });
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var jsonDataObject = json['list'] as List;
      return jsonDataObject
          .map((jsonObject) => Address.fromJson(jsonObject))
          .toList();
    }
    return [];
  }



  Future<List<City>> getCities() async {
    Uri uri = Uri.parse(ApiSettings.cities);
    var response = await http
        .get(uri, headers: {HttpHeaders.acceptHeader: 'application/json'});
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var jsonDataObject = json['list'] as List;
      return jsonDataObject
          .map((jsonObject) => City.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<ProcessResponse> deleteAddress  ({required int id }) async {

    String token =SharedPrefController().getValueFor<String>( PrefKeys.token.name)!;

    Uri uri = Uri.parse(ApiSettings.addresses+'/$id');
    print(uri);
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
