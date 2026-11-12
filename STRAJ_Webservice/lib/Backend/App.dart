import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:straj_webservice/Backend/Account.dart';
import 'package:http/http.dart' as http;
import 'package:straj_webservice/Backend/Customer.dart';
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

  static Future<Account> createCurrentAccount(Map<String,String> accData)async{
    checkForBaseURL();

    final request = await http.post(
      Uri.parse("${baseURL.text.trim()}/party/account/create/curr/account"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"body" : accData})
    );

    if(request.statusCode == 200){
      var response = jsonDecode(request.body);
      var data = response['body'];
      data['id'] = response['header']['id'];

      return Account.fromJson(data);
    }else{
      throw Exception(jsonDecode(request.body)['error']['errorDetails']);
    }
  }

  static Future<Customer> getCustomerRecord(String customerID)async{
    final request = await http.get(Uri.parse("${baseURL.text}/party/get/customer/record?customer=$customerID"));
    if(request.statusCode == 200){
      final data = jsonDecode(request.body)['body'] as List<dynamic>;

      if(data.isEmpty){
        throw Exception("No data available");
      }

      return Customer.fromJson(data[0]);
    }else{
      throw Exception(jsonDecode(request.body)['message']);
    }

  }

  static Future<void> editCustomerRecord(String customerID, Customer customerData)async{
    checkForBaseURL();

    final request = await http.put(
      Uri.parse("${baseURL.text.trim()}/party/customers/$customerID/edit/customer/data"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"body" : customerData.toJson()})
    );

    if(request.statusCode != 200){
      throw Exception(jsonDecode(request.body)['error']['errorDetails']);
    }
  }

  static Future<void> deleteUnauthorisedCustomer(String customerID)async{
    checkForBaseURL();

    final request = await http.delete(
      Uri.parse("${baseURL.text.trim()}/party/customers/$customerID/del/unauth/customer"),
    );

    if(request.statusCode != 200){
      throw Exception(jsonDecode(request.body)['message']);
    }
  }

}

