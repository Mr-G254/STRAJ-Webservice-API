import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:straj_webservice/Backend/Account.dart';
import 'package:http/http.dart' as http;

abstract class App{
  static ValueNotifier<bool> showError = ValueNotifier(false);
  static ValueNotifier<String> errorText = ValueNotifier("");
  static TextEditingController baseURL = TextEditingController();

  static Future<List<Account>> getAllUserAccounts(String customerID)async{
    if(baseURL.text.isEmpty){
      throw Exception("Enter the server URL to proceed.");
    }

    final request = await http.get(Uri.parse("${baseURL.text}/party/account/type?customer=$customerID"));
    if(request.statusCode == 200){
      final data = jsonDecode(request.body) as List<Map<String,dynamic>>;

      List<Account> allAccounts = List.generate(data.length, (index) => Account.fromJson(data[index]));
      return allAccounts;
    }else{
      throw Exception(jsonDecode(request.body));
    }
  }

  static Future<Map<String,dynamic>> createCurrentAccount(Map<String,String> accData)async{
    if(baseURL.text.isEmpty){
      throw Exception("Enter the server URL to proceed.");
    }

    final request = await http.post(
      Uri.parse("${baseURL.text.trim()}/party/account/create/curr/account"),
      body: jsonEncode(accData)
    );
    
    if(request.statusCode == 201){
      final data = jsonDecode(request.body) as Map<String,dynamic>;

      return data;
    }else{
      throw Exception(jsonDecode(request.body));
    }
  }

  static Future<Map<String,dynamic>> getCustomerRecord(String customerID)async{

    return <String,dynamic>{};
  }

  static Future<void> editCustomerRecord(String customerID, Map<String,dynamic> customerData)async{
    if(baseURL.text.isEmpty){
      throw Exception("Enter the server URL to proceed.");
    }

    final request = await http.put(
      Uri.parse("${baseURL.text.trim()}/party/customers/$customerID/edit/customer/record"),
      body: jsonEncode(customerData)
    );

    if(request.statusCode != 200){
      throw Exception(jsonDecode(request.body));
    }
  }

  Future<void> deleteUnauthorisedCustomer(String customerID)async{
    if(baseURL.text.isEmpty){
      throw Exception("Enter the server URL to proceed.");
    }

    final request = await http.delete(
      Uri.parse("${baseURL.text.trim()}/party/customers/$customerID/del/unauth/customer"),
    );

    if(request.statusCode != 200){
      throw Exception(jsonDecode(request.body));
    }
  }

}

