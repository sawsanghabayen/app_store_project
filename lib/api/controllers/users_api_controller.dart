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
      'city_id': user.cityId.toString(),
      'STORE_API_KEY': 'd3136b50-839a-4a1d-a030-874020601007',
    });
    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      print(json['code']);
      return ProcessResponse(
          message: json['message'] + ' ' + json['code'].toString(),
          success: json['status']);
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

  Future<ProcessResponse> activate(
      {required int mobile, required int code}) async {
    Uri uri = Uri.parse(ApiSettings.activate);
    var response = await http.post(uri, body: {
      'mobile': mobile.toString(),
      'code': code.toString(),
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ProcessResponse(message: json['message'], success: json['status']);
    }

    return errorResponse;
  }

  Future<ProcessResponse> changePassword(
      {required int currentP_password,
      required int new_password,
      required int new_password_confirmation}) async {
    Uri uri = Uri.parse(ApiSettings.changepassword);
    var response = await http.post(uri, headers: {
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor<String>(PrefKeys.token.name)!
    }, body: {
      'currentP_password': currentP_password.toString(),
      'new_password': new_password.toString(),
      'new_password_confirmation': new_password_confirmation.toString(),
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ProcessResponse(message: json['message'], success: json['status']);
    }
//8631
    return errorResponse;
  }

  Future<ProcessResponse> forgetPassword({required int mobile}) async {
    Uri uri = Uri.parse(ApiSettings.forgetpassword);
    var response = await http.post(uri, body: {
      'mobile': mobile.toString(),
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ProcessResponse(
          message: json['message'] + ' ' + json['code'].toString(),
          success: json['status']);
    }

    return errorResponse;
  }

  Future<ProcessResponse> resetPassword( {required int mobile,
      required int code,
      required int password,
      required int password_confirmation}) async {
    Uri uri = Uri.parse(ApiSettings.resetpassword);
    var response = await http.post(uri, body: {
      'mobile': mobile.toString(),
      'code': code.toString(),
      'password': password.toString(),
      'password_confirmation': password_confirmation.toString(),
    });
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ProcessResponse(
          message: json['message'] + ' ' + json['code'].toString(),
          success: json['status']);
    }
    return errorResponse;
  }

  Future<ProcessResponse> updateProfile(
      {required String name,
      required String gender,
      required String city_id}) async {
    Uri uri = Uri.parse(ApiSettings.updateprofile);
    var response = await http.post(uri, body: {
      'name': name,
      'gender': gender,
      'city_id': city_id.toString(),
    }, headers: {
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
      'X-Requested-With': 'XMLHttpRequest',
      'Accept': 'application/json'
    });
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      //TODO save user in shared preferences
      SharedPrefController().removeValueFor(PrefKeys.name.name);
      SharedPrefController().removeValueFor(PrefKeys.city_id.name);
      SharedPrefController().removeValueFor(PrefKeys.gender.name);

      SharedPrefController().saveChangeProfile(name: name, city_id: city_id, gender: gender);
      var json = jsonDecode(response.body);
      return ProcessResponse(message: json['message'], success: json['status']);
    }
    return errorResponse;
  }
}
