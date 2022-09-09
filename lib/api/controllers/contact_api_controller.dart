
import 'dart:convert';
import 'dart:io';

import '../../models/process_response.dart';
import '../../prefs/shared_pref_controller.dart';
import '../../utils/helpers.dart';
import '../api_settings.dart';
import 'package:http/http.dart' as http;

class ContactApiController with Helpers {

  Future<ProcessResponse> contact({
    required String subject ,
    required String message
}) async {
    Uri uri = Uri.parse(ApiSettings.contact);
    String token =SharedPrefController().getValueFor<String>( PrefKeys.token.name)!;
    var response = await http.post(uri, headers: {
      HttpHeaders.authorizationHeader : token,
      HttpHeaders.acceptHeader:'application/json'
    },body: {
      'subject':subject,
      'message': message,
    });
    if (response.statusCode == 201 || response.statusCode == 400) {
      var json = jsonDecode(response.body);

      return ProcessResponse(message: json['message'], success: json['status']);
    }

    return errorResponse;
  }
}