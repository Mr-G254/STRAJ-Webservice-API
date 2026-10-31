import 'package:flutter/material.dart';
import 'package:straj_webservice/Components.dart';
import 'package:straj_webservice/Enums/ResponseType.dart';
import 'package:straj_webservice/Enums/T24Operation.dart';

import '../Backend/App.dart';
import '../Backend/SuccessOrFail.dart';
import '../Enums/OperationStatus.dart';

class SearchAccounts extends StatefulWidget{
  const SearchAccounts({super.key});

  @override
  State<SearchAccounts> createState() => _SearchAccountState();
}

class _SearchAccountState extends State<SearchAccounts>{
  final customer = TextEditingController();
  bool isLoading = false;

  final loadingWidget = SizedBox(
    width: 23,
    height: 23,
    // margin: EdgeInsets.all(5),
    child: Center(
      child: CircularProgressIndicator(
        // padding: EdgeInsets.all(5),
        strokeWidth: 2.5,
        strokeCap: StrokeCap.round,
        color: Colors.white,
      ),
    ),
  );

  final textWidget = Container(
    padding: EdgeInsets.only(),
    child: Text(
      "Search",
      style: TextStyle(
        fontFamily: "IBM_Plex_Mono",
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w400
      ),
    ),
  );

  @override
  Widget build(BuildContext context){
    final display = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(),
          width: double.infinity,
          child: TabHeader(
            title: "Search Accounts",
            description: "Search for all accounts belonging to a specific customer"
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width: 500,
          padding: EdgeInsets.only(),
          child: Input(controller: customer, label: "Customer ID"),
        ),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.only(),
          height: 38,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff0B1F5E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5)),
              elevation: 0
            ),
            onPressed: ()async{
              App.showSuccessOrFail.value = SuccessOrFail(status: OperationStatus.clear);
              setState(() {
                isLoading = true;
              });

              if(customer.text.isEmpty){
                App.showSuccessOrFail.value = SuccessOrFail(status: OperationStatus.fail,successOrErrorText: "Enter the Customer ID to proceed.");

              }else{
                try{
                  final data  = await App.getAllUserAccounts(customer.text);

                  if(context.mounted){
                    Navigator.push(context, DialogRoute(context: context, builder: (context) => CustomDialog(type: ResponseType.success, title: "All the Accounts for Customer ${customer.text}", operation: T24Operation.searchAllCustomerAccounts, data: <String,dynamic>{"data" : data},)));
                  }
                }catch(e){
                  App.showSuccessOrFail.value = SuccessOrFail(status: OperationStatus.fail,successOrErrorText: e.toString());
                }
              }

              setState(() {
                isLoading = false;
              });
            },
            child: isLoading? loadingWidget : textWidget,
          ),
        )
      ],
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(),
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
          side: BorderSide(
            color: Color(0xffD6DAE0)
          )
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(30),
          child: display,
        ),
      ),
    );
  }
}