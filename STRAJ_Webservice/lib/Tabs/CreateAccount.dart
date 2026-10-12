import 'package:flutter/material.dart';
import 'package:straj_webservice/Components.dart';

class CreateAccount extends StatefulWidget{
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount>{
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
        Container(
          padding: EdgeInsets.only(),
          height: 38,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff0B1F5E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5)),
              elevation: 0
            ),
            onPressed: (){},
            child: Container(
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
            )
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