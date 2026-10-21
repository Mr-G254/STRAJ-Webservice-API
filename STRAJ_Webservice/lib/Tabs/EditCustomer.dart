import 'package:flutter/material.dart';
import 'package:straj_webservice/Components.dart';

import '../Backend/App.dart';
import '../Enums/ResponseType.dart';
import '../Enums/T24Operation.dart';

class EditCustomer extends StatefulWidget{
  const EditCustomer({super.key});

  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer>{
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
      "Lookup Customer",
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
            title: "Edit Customer data",
            description: "Edit an already existing customer record"
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
            onPressed: (){
              App.showError.value = false;
              if(customer.text.isNotEmpty){
                Navigator.push(context, DialogRoute(context: context, builder: (context) => CustomDialog(type: ResponseType.none, title: "Edit customer ${customer.text} data", operation: T24Operation.editCustomerData,)));
              }else{
                App.showError.value = true;
              }
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