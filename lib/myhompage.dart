import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'detail.dart';
import 'detail1.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selected=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light_cream_background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Stack(
            children: <Widget>[

              Container(
                height: MediaQuery.of(context).size.height*.666,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
                  boxShadow:[BoxShadow(color: dark_cream_background,blurRadius: 20)]


                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('asset/profile.jpg'),
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        RotatedBox(child: Text("ALL FRUITS",style: TextStyle(color: Colors.grey.shade500)),quarterTurns: -1,),
                        SizedBox(height: 25,),
                        RotatedBox(child: Text("POPULAR",style: TextStyle(color: Colors.grey.shade500)),quarterTurns: -1,),
                        SizedBox(height: 25,),

                        Stack(
                          alignment: Alignment.bottomRight,
                            children: <Widget>[
                              RotatedBox(child: Text("NEWEST",style: TextStyle(color: confirm_order_button),),quarterTurns: -1,),
                              Padding(
                                padding: const EdgeInsets.only(right: 20,bottom: 20),
                                child: Container(height: 5,width: 5,decoration: BoxDecoration(shape: BoxShape.circle,color: confirm_order_button),),
                              )
                            ],),
                        SizedBox(height: 20,),

                      ],
                    ),

                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:10.0, top: 70),
                    child: RichText(
                        text: TextSpan(text: 'Healthy Food ', style: TextStyle(color: Colors.black,fontSize: 30),children: [
                          TextSpan(
                              text: 'Delivery',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 30)
                          )
                        ]),

                      ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:100.0, top: 40),
                    child: Container(

                        height: MediaQuery.of(context).size.height/2+20,
                        width: MediaQuery.of(context).size.width,
                        child: Swiper(
                          itemCount: 3,
                          itemBuilder: (BuildContext context,int index){
                            return FruitList(image_index: index,content_summary :index, hero_tag:index,title:index,index: index,);
                          },

                          viewportFraction: 0.8,
                          scale: 0.9,


                        )

//                  child: ListView(
//                    scrollDirection: Axis.horizontal,
//                    children: <Widget>[
//                      FruitList(),
//                      FruitList(),
//                      FruitList(),
//
//
//                    ],
//                  ),
                    ),
                  )
                ],
              ),


//          Center(
//            // Center is a layout widget. It takes a single child and positions it
//            // in the middle of the parent.
//            child: Column(
//              // Column is also a layout widget. It takes a list of children and
//              // arranges them vertically. By default, it sizes itself to fit its
//              // children horizontally, and tries to be as tall as its parent.
//              //
//              // Invoke "debug painting" (press "p" in the console, choose the
//              // "Toggle Debug Paint" action from the Flutter Inspector in Android
//              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//              // to see the wireframe for each widget.
//              //
//              // Column has various properties to control how it sizes itself and
//              // how it positions its children. Here we use mainAxisAlignment to
//              // center the children vertically; the main axis here is the vertical
//              // axis because Columns are vertical (the cross axis would be
//              // horizontal).
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text(
//                  'You have pushed the button this many times:',
//                ),
//                Text(
//                  '',
//                  style: Theme.of(context).textTheme.display1,
//                ),
//              ],
//            ),
//          ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:20.0,right: 10,left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.filter_list,color: Colors.black54,),
                GestureDetector(
                  onTap: (){
                    setState(() {

                      selected=0;
                    });

                  },
                  child: Container(
                    padding: EdgeInsets.all(13),
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                    color: selected==0?confirm_order_button:Colors.transparent,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(5),bottomLeft: Radius.circular(5))
                    ),
                    child: Text('Fruits',style: TextStyle(color: selected==0?Colors.white:Colors.grey.shade500),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {

                      selected=1;
                    });

                  },
                  child: Container(
                    padding: EdgeInsets.all(13),
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        color: selected==1?confirm_order_button:Colors.transparent,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(5),bottomLeft: Radius.circular(5))
                    ),
                    child: Text('Vegetables',style: TextStyle(color: selected==1?Colors.white:Colors.grey.shade500),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {

                      selected=2;
                    });

                  },
                  child: Container(
                    padding: EdgeInsets.all(13),
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        color: selected==2?confirm_order_button:Colors.transparent,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(5),bottomLeft: Radius.circular(5))
                    ),
                    child: Text('Drinks',style: TextStyle(color: selected==2?Colors.white:Colors.grey.shade500),),
                  ),
                ),

              ],
            ),
          )
        ],
      ),

      bottomNavigationBar: CurvedNavigationBar(

        backgroundColor: dark_cream_background,
        items: <Widget>[
          Icon(Icons.home),
          Icon(Icons.favorite_border),

          Icon(Icons.shopping_basket),
          Icon(Icons.contact_phone),


        ],
      ),
    );
  }
}
class FruitList extends StatelessWidget {
  final image_index;
  final index;
  final title;
  final content_summary;
  final hero_tag;
  FruitList({this.image_index,this.content_summary,this.hero_tag,this.title,this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Details(index: index,)));

      },
      child: Stack(
       // alignment: Alignment.topRight,

        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Container(

              height: MediaQuery.of(context).size.height*.6666,
              width: MediaQuery.of(context).size.width/2-30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: dark_cream_background
              ),
              child: Padding(
                padding: const EdgeInsets.only(top:8.0,left: 30,right: 30,bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    titles[title],
                    SizedBox(
                      height: 10,
                    ),
                    Text(summary[content_summary])

                  ],
                ),
              ),

            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
      height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: green_color,
                  boxShadow: [BoxShadow(color: green_color,blurRadius: 2)]


                ),
                child:Icon(Icons.favorite,color: Colors.white,size: 20,),
              )

            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
                padding: EdgeInsets.only(right: 10,top: 10),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.grey.shade300,blurRadius: 15)]



                      ),

                    ),
                    Container(
                      height: 100,
                      width: 160,
                      child: Hero(
                          tag: hero[hero_tag],
                        child: Image(

                          image: AssetImage(images[image_index]),
                        ),
                      ),
                    )
                  ],
                )

            ),
          ),

        ],

      ),
    );
  }
}
