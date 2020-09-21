import 'package:flutter/material.dart';
import 'cookie_detail.dart';

class CookiePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
          children: [
            SizedBox(height: 15.0,),
            Container(
      width: MediaQuery.of(context).size.width - 30.0,
      height: MediaQuery.of(context).size.height - 50.0,
      child: GridView.count(
        shrinkWrap: true,
        padding: EdgeInsets.all(10.0),
        crossAxisCount: 2, 
        primary: false,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 15.0,
        childAspectRatio: 0.8,
        children: <Widget>[
          _buildCard(1,"Cookie min", '\$3.99', 'assets/images/cookiemint.jpg', true, false, context),
          _buildCard(2,"Cookie", "\$ 2.99", "assets/images/cookie.png", false, true, context),
          _buildCard(3,"Cookie Choco", "\$5.99", "assets/images/cookiechoco.jpg", false, true, context),
          _buildCard(4,"Cookie Classic", "\$6.99", "assets/images/cookieclassic.jpg", true, false, context),
          _buildCard(5,"Cookie Cream", "\$ 4.50", "assets/images/cookiecream.jpg", true, true, context),
          _buildCard(6,"Cookie van", "\$4.99", "assets/images/cookievan.jpg", false, true, context),
          _buildCard(7,"Cookie Choco", "\$5.99", "assets/images/cookiechoco.jpg", true, true, context),
          _buildCard(8,"Cookie Classic", "\$6.99", "assets/images/cookieclassic.jpg", true, false, context),
        ],),
            )
          ],
        ),
    );
  }


  Widget _buildCard(int index, String name, String price, String img, bool isAdded, bool isFavorite, BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 5.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context,  MaterialPageRoute(builder: (context)=>
           CookieDetail(
             index: index,
              imgPath: img, 
              cookieName: name, 
              cookiePrice: price,
              )
            )
            );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), 
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0
              )
            ],
            color: Colors.white
          ),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isFavorite ? Icon(Icons.favorite, color: Color(0xFFEF7532),):
                  Icon(Icons.favorite_border, color: Color(0xFFEF7532),)
                ],
              ),
              ),
          Hero(tag: '$img$index', child: Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(img), fit: BoxFit.contain)
            ),
          )
          ),
          SizedBox(height: 7.0,), 
          Text(price, style: TextStyle(
            color: Color(0xFFCC8053), fontSize: 14.0
          ),
          ),
          Text(name, style: TextStyle(
            color: Color(0xFF575E67), fontSize: 14.0
          ),
          ),
          Padding(padding: EdgeInsets.all(8.0), child: Container(height: 1.0, color: Color(0xFFEBEBEB),),),
          Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if(!isAdded)...[
                Icon(Icons.shopping_basket, color: Color(0xffd17e50), size: 20.0,),
                Text('Add to cart',
                style: TextStyle(fontFamily: 'Varela', color: Color(0xffd17e50), fontSize: 15.0),)
                ],
              if(isAdded)...[
                Icon(Icons.remove_circle_outline, color: Color(0xffd17e50), size: 25.0,),
                Text('3', style: TextStyle(fontSize: 15.0, color: Color(0xffd17e50), fontFamily: 'Varela'),),
                Icon(Icons.add_circle_outline, color: Color(0xffd17e50), size: 25.0,)
              ]
            ],
          ),)
          ],
          ),
        ),
      ),
      );
  }
}