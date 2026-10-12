import 'package:flutter/material.dart';
import 'package:straj_webservice/Tabs/CreateAccount.dart';
import 'package:straj_webservice/Tabs/DeleteCustomer.dart';
import 'package:straj_webservice/Tabs/EditCustomer.dart';
import 'package:straj_webservice/Tabs/SearchAccounts.dart';

import 'Components.dart';

class T24Webservice extends StatefulWidget{
  const T24Webservice({super.key});

  @override
  State<T24Webservice> createState() => _T24WebserviceState();
}

class _T24WebserviceState extends State<T24Webservice> with TickerProviderStateMixin{
  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context){

    final bar = CustomTab(
      tabOptions: [
        "Search Accounts",
        "Create Account",
        "Edit Customer",
        "Delete Customer"
      ],
      tabWidgets: [
        SearchAccounts(),
        CreateAccount(),
        EditCustomer(),
        DeleteCustomer()
    ],
    );

    final window = Column(
      children: [
        Container(
          padding: EdgeInsets.only(),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(2)),
                  elevation: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    child: Image(
                      image: AssetImage("Icons/logo.png"),
                      // height: 50,
                      width: 60,
                    ),
                  )
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Webservice API Assignment",
                  style: TextStyle(
                    color: Color(0xff121C3E),
                    fontFamily: "IBM_Plex_Sans",
                    fontWeight: FontWeight.w600,
                    fontSize: 30
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(13),
          alignment: Alignment.center,
          child: Text(
            "An implementation of the the STRAJ t24 Webservice API assignment with reference to the previous work submitted",
            style: TextStyle(
              fontFamily: "IBM_Plex_Mono",
              fontSize: 14,
              overflow: TextOverflow.ellipsis,
              color: Color(0xff5A5F66),
              fontWeight: FontWeight.w400
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 1030,
            padding: EdgeInsets.only(),
            child: bar,
          ),
        )
      ],
    );

    return Container(
      color: Color(0xffF4F5F7),
      padding: EdgeInsets.only(right: 20,left: 20,top: 20),
      child: window,
    );
  }
}