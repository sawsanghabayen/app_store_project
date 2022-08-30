import 'package:database_app/database/db_controller.dart';
import 'package:database_app/models/process_response.dart';
import 'package:database_app/prefs/shared_pref_controller.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/user.dart';

class UserDbController{
  // Login , Register
  final Database _database =DbController().database;

  Future<ProcessResponse> login({required String email , required String password}) async{
    List<Map<String,dynamic>> rowsMap =await _database.query(User.tableName ,where:'email = ? AND password = ?' ,whereArgs:[email , password]);
    if(rowsMap.isNotEmpty){
      print(rowsMap);
      User user =User.fromMap(rowsMap.first);
      SharedPrefController().save(user: user);
      return ProcessResponse(message: 'Logged In Successfully',success: true);
    }
    return  ProcessResponse(message: 'Credential Error , Check and Try Again!' , success: false);


  }
  Future<ProcessResponse> register({required User user}) async{
    print(user.name);
    print(user.email);
    print(user.password);
    // 1) rowInsert()
    // int newRowId =await _database.rawInsert('INSERT INTO users (name,email,password) VALUES (?, ?,?)',
    //     [user.name , user.email ,user.password]);


    if(await _isUniqueEmail(email:user.email)){
      // 2) insert()
      int newRowId =await _database.insert(User.tableName, user.toMap());

      return ProcessResponse(message: newRowId!=0 ? 'Registered Successfully':'Register Failed!',success: newRowId !=0 );

    }
    else {
      return ProcessResponse(message: 'Email Exists ,Use Another!' ,success: false);
    }
    }




  Future<bool> _isUniqueEmail({required String email}) async{
         List<Map<String,dynamic>> rowsMap= await _database.rawQuery('SELECT * FROM users WHERE email =?' ,[email]);

    return rowsMap.isEmpty;

  }



}