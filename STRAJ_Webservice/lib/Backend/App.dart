import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:straj_webservice/Backend/Account.dart';
import 'package:http/http.dart' as http;
import 'package:straj_webservice/Backend/SuccessOrFail.dart';
import 'package:straj_webservice/Enums/OperationStatus.dart';

abstract class App{
  static ValueNotifier<SuccessOrFail>  showSuccessOrFail = ValueNotifier(SuccessOrFail(status: OperationStatus.clear,));
  static TextEditingController baseURL = TextEditingController();
  static final Map<String,String> _headers = {"Content-Type": "application/json"};

  static void checkForBaseURL(){
    if(baseURL.text.isEmpty){
      throw Exception("Enter the server URL to proceed.");
    }
  }


  static Future<List<Account>> getAllUserAccounts(String customerID)async{
    checkForBaseURL();

    final request = await http.get(Uri.parse("${baseURL.text}/party/account/type?customer=$customerID"));
    if(request.statusCode == 200){
      final data = jsonDecode(request.body)['body'] as List<dynamic>;

      if(data.isEmpty){
        throw Exception("No data available");
      }

      List<Account> allAccounts = List.generate(data.length, (index) => Account.fromJson(data[index]));
      return allAccounts;
    }else{
      throw Exception(jsonDecode(request.body)['message']);
    }
  }

  static Future<Map<String,dynamic>> createCurrentAccount(Map<String,String> accData)async{
    checkForBaseURL();

    final request = await http.post(
      Uri.parse("${baseURL.text.trim()}/party/account/create/curr/account?validate_only=true"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"body" : accData})
    );
    
    if(request.statusCode == 201){
      var data = jsonDecode(request.body) as Map<String,dynamic>;
      data['id'] =  request.headers['id'];
      print(data);
      return data;
    }else{
      throw Exception(jsonDecode(request.body)['error']['errorDetails']);
    }
  }

  static Future<Map<String,dynamic>> getCustomerRecord(String customerID)async{

    return <String,dynamic>{};
  }

  static Future<void> editCustomerRecord(String customerID, Map<String,dynamic> customerData)async{
    checkForBaseURL();

    final request = await http.put(
      Uri.parse("${baseURL.text.trim()}/party/customers/$customerID/edit/customer/record"),
      body: jsonEncode(customerData)
    );

    if(request.statusCode != 200){
      throw Exception(jsonDecode(request.body)['message']);
    }
  }

  Future<void> deleteUnauthorisedCustomer(String customerID)async{
    checkForBaseURL();

    final request = await http.delete(
      Uri.parse("${baseURL.text.trim()}/party/customers/$customerID/del/unauth/customer"),
    );

    if(request.statusCode != 200){
      throw Exception(jsonDecode(request.body)['message']);
    }
  }

}

