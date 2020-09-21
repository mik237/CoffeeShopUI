import 'package:flutter/material.dart';

import 'bottom_bar.dart';
import 'cookie_page.dart';


void main(){
  runApp(CoffeeShopApp());
}

class CoffeeShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Shop',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: CoffeeShopHomePage('Coffee Shop'),);
  }
}

class CoffeeShopHomePage extends StatefulWidget {

  final String title;
  CoffeeShopHomePage(this.title);

  @override
  _CoffeeShopHomePageState createState() => _CoffeeShopHomePageState();
}

class _CoffeeShopHomePageState extends State<CoffeeShopHomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68),
          ),
          onPressed: (){},
          ),
          title: Text(widget.title,           
          style: TextStyle(
            fontFamily: 'Schyler', fontSize: 20.0, color: Color(0xFF545D68)
          )
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.notifications_none, color: Color(0xFF545D68),),
            onPressed: (){},)
          ],
        ),

        body: Column(
          children: <Widget>[
            SizedBox(height: 15.0,),
            Text('Categories', style: TextStyle( fontSize: 40.0, fontWeight: FontWeight.bold)), 
            SizedBox(height: 15.0,),
            TabBar(
              controller: _tabController,
              indicatorColor: Color(0xFFC88D67),
              labelColor: Color(0xFFC88D67),
              unselectedLabelColor: Color(0xFFCDCDCD),
              labelPadding: EdgeInsets.only(right: 20.0),
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text('Cookies', 
                  style: TextStyle(
                    fontFamily: 'Schyler',
                    fontSize: 21.0
                  )),
                ),
                Tab(
                  child: Text('Cookie Cake', 
                  style: TextStyle(
                    fontFamily: 'Schyler',
                    fontSize: 21.0
                  )),
                ),
                Tab(
                  child: Text('Ice Cream', 
                  style: TextStyle(
                    fontFamily: 'Schyler',
                    fontSize: 21.0
                  )),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  CookiePage(),
                  CookiePage(),
                  CookiePage()
                ]
                ),
            )
          ],
        ),

        floatingActionButton: FloatingActionButton(
          heroTag: "btn123",
          onPressed: (){},
          backgroundColor: Color(0xFFF17535),
          child: Icon(Icons.fastfood),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomBar(),
    );
  }
}


