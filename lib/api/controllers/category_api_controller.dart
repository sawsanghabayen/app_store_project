// import 'dart:convert';
// import 'dart:io';
// import 'package:database_app/prefs/shared_pref_controller.dart';
// import 'package:database_app/utils/helpers.dart';
// import '../../models/home.dart';
// import '../../models/sub_category.dart';
// import '../api_settings.dart';
// import 'package:http/http.dart' as http;
//
// class CategoryApiController with Helpers {
//   Future<List<Categories>> getCategory() async {
//     var response = await http.get(Uri.parse(ApiSettings.categories), headers: {
//       HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
//       'X-Requested-With': 'XMLHttpRequest',
//     }
//     );
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       var dataJson = jsonDecode(response.body)['list'] as List;
//       List<Categories> categories =
//       dataJson.map((e) => Categories.fromJson(e)).toList();
//       return categories;
//     }
//     return [];
//   }
//
//   Future<List<SubCategory>> getSubCategory({required int id}) async {
//     var response = await http.get(Uri.parse(ApiSettings.categories+'/$id'), headers: {
//       HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
//       'X-Requested-With': 'XMLHttpRequest',
//     });
//     if (response.statusCode == 200 || response.statusCode == 400) {
//         var data = jsonDecode(response.body)['list'] as List;
//         List<SubCategory> subCategories =
//         data.map((e) => SubCategory.fromJson(e)).toList();
//         return subCategories;
//     }
//     return [];
//   }
// }
import 'dart:convert';
import 'dart:io';

import 'package:database_app/api/api_settings.dart';
import 'package:database_app/models/home.dart';
import 'package:database_app/prefs/shared_pref_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class StoreApiController{
  Future<List<Categories>> getCategories() async{
    String token =SharedPrefController().getValueFor<String>( PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.categories);
    var response= await http.get(uri,headers: {
      HttpHeaders.authorizationHeader : token,
      HttpHeaders.acceptHeader:'application/json'

    });
    if(response.statusCode == 200  ){
      var json=jsonDecode(response.body);
      var dataJsonObject=json['list'] as List;
      return dataJsonObject
          .map((jsonObject) => Categories.fromJson(jsonObject)).toList();
    }
    return[];
  }
}
