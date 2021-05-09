import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:naturals/constants.dart';

class Services {
  String title;
  int price1;
  int price2;

  Services(this.title, this.price1, this.price2);
}

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screenAppBar(),
      bottomNavigationBar: screenNavBar(),
      body: SingleChildScrollView (
        child: Column (
          children: <Widget> [
            searchBar(),
            ComboListBuilder(),
            QuickCategoryList(),
            SizedBox(height:40),
            Text(
              "Cut & Style",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            ),
            ServiceList(),
          ]
        )
      ) 
    );
  }

  AppBar screenAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Naturals",
              style: TextStyle(
                color: colorText, 
                fontSize: 20
              )
            ),
            TextSpan(
              text: "@Hoodi",
              style: TextStyle(
                color: colorTextHighlight, 
                fontSize: 20, 
                fontWeight: FontWeight.bold
              )
            ),
          ]
        ),
      )
    );
  }

  BottomNavigationBar screenNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 10,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list_rounded),
          label: 'Services',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: colorIconHighlight,
      onTap: _onItemTapped,
    );
  }

  Container searchBar() {
    return Container (
      margin: const EdgeInsets.fromLTRB(20,10,20,30),
      padding: const EdgeInsets.only(right:10, left:10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: colorText.withOpacity(0.3)
        ),
        borderRadius: BorderRadius.circular(50),
      ), 
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.search, color: colorIconHighlight),
          hintText: "Search",
        ),
      )
    );
  }

}

class ComboListBuilder extends StatelessWidget {
    
  Container placeholderBox(double w) {
    return Container (
      width: w,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container (
      height: 180,
      margin: const EdgeInsets.fromLTRB(10,0,10,10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context,int index){
          return placeholderBox(250);
        }
      ),
    );
  }
}

class QuickCategoryList extends StatelessWidget {
  
  Column quickCategory(IconData categoryIcon, String categoryTitle) {
    return Column (
      children: [
        Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black12,
          ),
          child: Center(
            child: Icon(categoryIcon)
          ),
        ),
        Text(categoryTitle)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container (
      margin: const EdgeInsets.all(10),
      child: Column (
        children: <Widget> [
          Row (
            children: [
              Expanded(flex:1, child:quickCategory(Icons.spa_outlined, "Title")),
              Expanded(flex:1, child:quickCategory(Icons.spa_outlined, "Title")),
              Expanded(flex:1, child:quickCategory(Icons.spa_outlined, "Title")),
              Expanded(flex:1, child:quickCategory(Icons.spa_outlined, "Title")),
            ]
          ),
          Row (
            children: [
              Expanded(flex:1, child:quickCategory(Icons.spa_outlined, "Title")),
              Expanded(flex:1, child:quickCategory(Icons.spa_outlined, "Title")),
              Expanded(flex:1, child:quickCategory(Icons.spa_outlined, "Title")),
              Expanded(flex:1, child:quickCategory(Icons.more_horiz, "More")),
            ]
          ),
        ]
      )
    );
  }
}

class ServiceList extends StatelessWidget {

  final List<Services> services = [
    Services("Hair Trim", 250, 225),
    Services("Hair cut - Senior Stylist", 750, 600),
    Services("Hair cut - Stylist", 550, 500),
    Services("Fringe Cut", 100, 100),
    Services("Kids Hair Cut", 180, 150),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: services.map((service) {
          return ServiceItem(title: service.title, price1: service.price1, price2: service.price2);
        }).toList(),
      )
    );
  }
}

class ServiceItem extends StatefulWidget {
  const ServiceItem({
    Key key,
    @required this.title,
    @required this.price1,
    @required this.price2,
  }) : super(key: key);

  final String title;
  final int price1;
  final int price2;

  @override
  _ServiceItemState createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Container (
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration (
        border: Border.all(
          color: colorText.withOpacity(0.3)
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row (
        children: [
          Expanded(
            flex: 8,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 20,
                  )
                ),
                SizedBox(height: 5),
                Text(
                  "Price: ₹${widget.price1}",
                  style: TextStyle(
                    fontSize: 12,
                  )
                ),
                Text(
                  "Member Price: ₹${widget.price2}",
                  style: TextStyle(
                    fontSize: 12,
                    color: colorTextHighlight,
                    fontWeight: FontWeight.bold
                  )
                ),
              ],
            )
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
            onTap: () {
              setState(() {
                checkboxValue = !checkboxValue;
              });
            },
            child: checkboxValue
              ? Icon(
                  Icons.check_circle,
                  color: colorIconHighlight,
                  size: 35,
                  )
              : Icon(
                  Icons.add_circle_outline,
                  color: Colors.grey,
                  size: 30,
                  ),
            ),
          )
        ],
      )
    ); 
  }
}