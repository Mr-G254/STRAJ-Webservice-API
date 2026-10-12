import 'package:flutter/material.dart';
import 'package:straj_webservice/Components.dart';

class SearchAccounts extends StatefulWidget{
  const SearchAccounts({super.key});

  @override
  State<SearchAccounts> createState() => _SearchAccountState();
}

class _SearchAccountState extends State<SearchAccounts>{
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
                "Search",
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