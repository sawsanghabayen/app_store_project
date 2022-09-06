import 'dart:convert';
import 'dart:io';

import 'package:database_app/api/api_settings.dart';
import 'package:database_app/models/city.dart';
import 'package:database_app/models/user.dart';
import 'package:database_app/prefs/shared_pref_controller.dart';
import 'package:database_app/utils/helpers.dart';
import 'package:http/http.dart' as http;

import '../../models/home.dart';
import '../../models/process_response.dart';

class UsersApiController with Helpers {
  Future<ProcessResponse> login(
      {required String mobile, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response =
        await http.post(uri, body: {'mobile': mobile, 'password': password});
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        User user = User.fromJson(json['data']);
        //TODO save user in shared preferences
        SharedPrefController().save(user);
      }
      return ProcessResponse(message: json['message'], success: json['status']);
    }

    return errorResponse;
  }

  Future<ProcessResponse> register(User user) async {
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(uri, body: {
      'name': user.name,
      'mobile': user.mobile,
      'password': user.password,
      'gender': user.gender,
      'city_id': user.cityId,
      'STORE_API_KEY': 'd3136b50-839a-4a1d-a030-874020601007',
    });
    print(response.body);
    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);

      return ProcessResponse(message: json['message'], success: json['status']);
    }

    return errorResponse;
  }

  Future<ProcessResponse> logout() async {
    String token =
        SharedPrefController().getValueFor<String>(PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.logout);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json',
    });

    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      SharedPrefController().clear();

      return ProcessResponse(message: json['message'], success: json['status']);
    }

    return errorResponse;
  }

  Future<List<City>> getCities() async {
    Uri uri = Uri.parse(ApiSettings.cities);
    var response = await http
        .get(uri, headers: {HttpHeaders.acceptHeader: 'application/json'});
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var jsonDataObject = json['list'] as List;
      return jsonDataObject
          .map((jsonObject) => City.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  // Future<List<dynamic>> getCities() async {
  //   Uri uri = Uri.parse(ApiSettings.cities);
  //   var response = await http.get(uri, headers: {HttpHeaders.acceptHeader: 'application/json'});
  //   print(response.statusCode);
  //   if (response.statusCode == 200 || response.statusCode == 400) {
  //     var json = jsonDecode(response.body);
  //     List<dynamic> data = json['list'];
  //     return data;
  //   }
  //   return [];
  // }

  //
  // Future<List<MySlider>> getImageSlider() async {
  //   String token =
  //       SharedPrefController().getValueFor<String>(PrefKeys.token.name)!;
  //   Uri uri = Uri.parse(ApiSettings.home);
  //   var response = await http.get(uri, headers: {
  //     HttpHeaders.authorizationHeader: token,
  //     HttpHeaders.acceptHeader: 'application/json',
  //   });
  //   if (response.statusCode == 200 || response.statusCode == 400) {
  //     var json = jsonDecode(response.body);
  //     var dataJsonObject =json['data']['slider'] as List;
  //     List<MySlider> mySlider = dataJsonObject.map((jsonObject) => MySlider.fromJson(jsonObject)).toList();
  //     return mySlider;
  //   }
  //   return [];
  // }

  Future<Home?> getHome() async {
    var response = await http.get(Uri.parse(ApiSettings.home), headers: {
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
      'X-Requested-With': 'XMLHttpRequest',
      'Accept': 'application/json'
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      var jsonDataObject = jsonDecode(response.body)['data'];
      Home home = Home.fromJson(jsonDataObject);
      return home;
    }
  }
}
