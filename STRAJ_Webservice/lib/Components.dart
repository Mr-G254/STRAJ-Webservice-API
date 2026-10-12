import 'package:flutter/material.dart';

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