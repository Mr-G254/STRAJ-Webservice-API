import 'package:flutter/material.dart';
import 'package:straj_webservice/Components.dart';

import '../Enums/ResponseType.dart';
import '../Enums/T24Operation.dart';

class CreateAccount extends StatefulWidget{
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount>{
  final customer = TextEditingController();
  final accountTitle = TextEditingController();
  final currency = TextEditingController();
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
      "Create",
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
            title: "Create Account",
            description: "Create a current account for your customer. (CATEGORY : 1001)"
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Expanded(child: Input(controller: accountTitle, label: "Account Title")),
            SizedBox(width: 20,),
            Expanded(child: Input(controller: customer, label: "Customer ID")),
            SizedBox(width: 20,),
            Expanded(child: Input(controller: currency, label: "Currency")),
          ],
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
              Navigator.push(context, DialogRoute(context: context, builder: (context) => CustomDialog(type: ResponseType.success, title: "Account has been successfully created", operation: T24Operation.createAccount,)));
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