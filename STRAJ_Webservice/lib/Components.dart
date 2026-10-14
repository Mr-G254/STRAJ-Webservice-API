import 'package:flutter/material.dart';
import 'package:straj_webservice/Enums/ResponseType.dart';
import 'package:straj_webservice/Enums/T24Operation.dart';

class CustomTab extends StatefulWidget{
  final List<String> tabOptions;
  final List<Widget> tabWidgets;
  const CustomTab({super.key, required this.tabOptions, required this.tabWidgets,});

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab>{
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context){
    final tabBar = Card(
      color: Color(0xff5A5F66).withValues(alpha: 0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
      elevation: 0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.all(1.2),
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.tabOptions.length, (index){
              return Container(
                padding: EdgeInsets.all(0),
                width: 250,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
                    color: _selectedIndex == index? Colors.white : Colors.transparent,
                    elevation: 0,
                    child: Container(
                      padding: EdgeInsets.all(0),
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        widget.tabOptions[index],
                        style: TextStyle(
                            fontFamily: "IBM_Plex_Mono",
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: _selectedIndex == index? Color(0xff121C3E) : Color(0xff5A5F66),
                            fontWeight: _selectedIndex == index? FontWeight.w600 : FontWeight.w400
                        ),
                      ),
                    )
                  ),
                ),
              );
            }),
          ),
        ),
      )
    );
    
    final tabView = IndexedStack(
      index: _selectedIndex,
      children: widget.tabWidgets
    );

    return Container(
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          tabBar,
          SizedBox(height: 5,),
          tabView
        ],
      ),
    );
  }
}

class TabHeader extends StatefulWidget{
  final String title;
  final String description;
  const TabHeader({super.key, required this.title, required this.description});

  @override
  State<TabHeader> createState() => _TabHeaderState();
}

class _TabHeaderState extends State<TabHeader>{

  @override
  Widget build(BuildContext context) {
    final display = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            widget.title,
            style: TextStyle(
              fontFamily: "IBM_Plex_Mono",
              fontSize: 17,
              color: Color(0xff121C3E),
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(),
          child: Text(
            widget.description,
            style: TextStyle(
              fontFamily: "IBM_Plex_Mono",
              fontSize: 14,
              color: Color(0xff5A5F66),
              fontWeight: FontWeight.w400
            ),
          ),
        )
      ],
    );
    
    return Container(
      padding: EdgeInsets.only(),
      child: display,
    );

  }
}

class Input extends StatelessWidget{
  final TextEditingController controller;
  final String label;
  const Input({super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    final display = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: "IBM_Plex_Mono",
              fontSize: 14,
              color: Color(0xff5A5F66),
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        Container(
          height: 40,
          padding: EdgeInsets.only(),
          child: TextField(
            controller: controller,
            cursorColor: Colors.black,
            style: TextStyle(
              fontFamily: "IBM_Plex_Mono",
              fontSize: 15,
              color: Colors.black,
              height: 1
              // fontWeight: FontWeight.w600
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff5A5F66),width: 1),
                borderRadius: BorderRadius.circular(6)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff3D5FB0),width: 1),
                borderRadius: BorderRadius.circular(6)
              )
            ),
          ),
        )
      ],
    );

    return Container(
      padding: EdgeInsets.only(top: 10),
      child: display,
    );

  }
}

class CustomDialog extends StatelessWidget{
  final ResponseType type;
  final String title;
  final T24Operation operation;
  const CustomDialog({super.key, required this.type, required this.title, required this.operation});

  @override
  Widget build(BuildContext context) {

    final titleBar = Container(
      padding: EdgeInsets.only(top: 30,left: 35),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: "IBM_Plex_Mono",
                fontSize: 17,
                color: Color(0xff121C3E),
                fontWeight: FontWeight.w600
              ),
            ),
          ),
        ],
      ),
    );

    final bottomBar = Container(
      height: 70,
      padding: EdgeInsets.only(),
      decoration: BoxDecoration(
        color: Color(0xff5A5F66).withValues(alpha: 0.1),
        border: Border(
          top: BorderSide(color: Color(0xff5A5F66).withValues(alpha: 0.3),width: 1)
        )
      ),
      child: Row(
        children: [
          Expanded(child: SizedBox()),
          Visibility(
            visible: operation == T24Operation.editCustomerData,
            child: Container(
              padding: EdgeInsets.only(right: 20),
              height: 35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5),
                    side: BorderSide(color: Color(0xff0B1F5E),width: 1)
                  ),
                  elevation: 0
                ),
                onPressed: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "Save Changes",
                    style: TextStyle(
                      fontFamily: "IBM_Plex_Mono",
                      fontSize: 13,
                      color: Color(0xff0B1F5E),
                      fontWeight: FontWeight.w500
                    ),
                  ),
                )
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: Container(
              padding: EdgeInsets.only(right: 20),
              height: 35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0B1F5E),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5)),
                  elevation: 0
                ),
                onPressed: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "Close",
                    style: TextStyle(
                      fontFamily: "IBM_Plex_Mono",
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                )
              ),
            ),
          ),
          Visibility(
            visible: operation == T24Operation.deleteCustomer,
            child: Container(
              padding: EdgeInsets.only(right: 20),
              height: 35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffA8281F),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5)),
                  elevation: 0
                ),
                onPressed: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "Delete Customer",
                    style: TextStyle(
                      fontFamily: "IBM_Plex_Mono",
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                )
              ),
            ),
          ),
        ],
      ),
    );

    final display = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
      backgroundColor: Colors.white,
      child: Container(
        width: 600,
        padding: EdgeInsets.only(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            titleBar,
            operation == T24Operation.createAccount? NewAccountDisplay(data:{}) : operation == T24Operation.editCustomerData? EditCustomerDisplay(data: {}) : operation ==T24Operation.deleteCustomer? DeleteCustomerDisplay(data: {}) : SizedBox(height: 20,),
            bottomBar
          ],
        ),
      ),
    );

    return Container(
      padding: EdgeInsets.only(),
      child: display,
    );
  }
}

class NewAccountDisplay extends StatelessWidget{
  final Map<String,String> data;
  NewAccountDisplay({super.key, required this.data,});

  String customer = "100006";
  String category = '1001';
  String account = '1000000000046657';
  String title = 'STRAJ Test Account';
  String currency = 'USD';

  @override
  Widget build(BuildContext context){

    final display = Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(6)),
      elevation: 0,
      color: Color(0xff5A5F66).withValues(alpha: 0.1),
      child: Container(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NewAccountLabel(labelTitle: "ACCOUNT TITLE", labelText: title),
                SizedBox(height: 20,),
                NewAccountLabel(labelTitle: "ACCOUNT ID", labelText: account),
                SizedBox(height: 20,),
                NewAccountLabel(labelTitle: "CURRENCY", labelText: currency),
              ],
            )),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                NewAccountLabel(labelTitle: "CUSTOMER ID", labelText: customer),
                SizedBox(height: 20,),
                NewAccountLabel(labelTitle: "CATEGORY CODE", labelText: category),
                SizedBox(height: 20,),
                NewAccountLabel(labelTitle: "", labelText: ""),
              ],
            )),
          ],
        ),
      )
    );

    return Container(
      padding: EdgeInsets.only(right: 30,left: 30,top: 25,bottom: 25),
      child: display,
    );
  }
}

class NewAccountLabel extends StatelessWidget{
  final String labelTitle;
  final String labelText;
  const NewAccountLabel({super.key, required this.labelTitle, required this.labelText});

  @override
  Widget build(BuildContext context){
    final display = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            labelTitle,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontFamily: "IBM_Plex_Mono",
              fontSize: 13,
              color: Color(0xff5A5F66),
              fontWeight: FontWeight.w400
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            labelText,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontFamily: "IBM_Plex_Mono",
              fontSize: 16,
              color: Color(0xff121C3E),
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      ],
    );

    return Container(
      padding: EdgeInsets.only(),
      child: display,
    );
  }
}

class EditCustomerDisplay extends StatelessWidget{
  final Map<String,String> data;
  EditCustomerDisplay({super.key, required this.data,});

  final mnemonic = TextEditingController();
  final shortName = TextEditingController();
  final name = TextEditingController();
  final sector = TextEditingController();
  final language = TextEditingController();
  final reside = TextEditingController();
  final nationality = TextEditingController();

  @override
  Widget build(BuildContext context){

    final display = Container(
      padding: EdgeInsets.only(),
      child: Row(
        children: [
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Input(controller: mnemonic, label: "Mnemonic"),
              SizedBox(height: 10,),
              Input(controller: shortName, label: "Short Name"),
              SizedBox(height: 10,),
              Input(controller: name, label: "Name"),
              SizedBox(height: 10,),
              Input(controller: sector, label: "Sector"),
            ],
          )),
          SizedBox(width: 25,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Input(controller: language, label: "Language"),
              SizedBox(height: 10,),
              Input(controller: reside, label: "Reside"),
              SizedBox(height: 10,),
              Input(controller: nationality, label: "Nationality"),
              SizedBox(height: 85,),
            ],
          )),
        ],
      ),
    );

    return Container(
      padding: EdgeInsets.only(right: 30,left: 30,top: 5,bottom: 30),
      child: SingleChildScrollView(child: display,),
    );
  }
}

class DeleteCustomerDisplay extends StatelessWidget{
  final Map<String,String> data;
  const DeleteCustomerDisplay({super.key, required this.data,});

  @override
  Widget build(BuildContext context){

    final display = Container(
      padding: EdgeInsets.only(),
      child: Text(
        "The customer provided will be removed from core banking system. This cannot be undone.",
        style: TextStyle(
          fontFamily: "IBM_Plex_Mono",
          fontSize: 14,
          color: Color(0xff5A5F66),
          fontWeight: FontWeight.w400
        ),
      ),
    );

    return Container(
      padding: EdgeInsets.only(right: 30,left: 30,top: 15,bottom: 30),
      child: display,
    );
  }
}