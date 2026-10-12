import 'package:flutter/material.dart';
import 'package:straj_webservice/Components.dart';

class EditCustomer extends StatefulWidget{
  const EditCustomer({super.key});

  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer>{
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
                "Lookup Customer",
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