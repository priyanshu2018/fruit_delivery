import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'detail.dart';
import 'animation_Text.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int selected = 0;
  Animation animation1;
  AnimationController controller1;

  @override
  void initState() {
    controller1 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation1 = Tween<double>(begin: 0, end: 80).animate(controller1)
      ..addListener(() {
        setState(() {});
      });
    controller1.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightCreamBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .666,
                width: animation1.value,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(color: darkCreamBackground, blurRadius: 20)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('asset/profile.jpg'),
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        RotatedBox(
                          child: Text("ALL FRUITS",
                              style: TextStyle(color: Colors.grey.shade500)),
                          quarterTurns: -1,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        RotatedBox(
                          child: Text("POPULAR",
                              style: TextStyle(color: Colors.grey.shade500)),
                          quarterTurns: -1,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            RotatedBox(
                              child: Text(
                                "NEWEST",
                                style: TextStyle(color: confirmOrderButton),
                              ),
                              quarterTurns: -1,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, bottom: 20),
                              child: Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: confirmOrderButton),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, top: 70.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Healthy Food ',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        AnimatedText(text: 'Delivery', fontSize: 30)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, top: 40),
                    child: Container(
                        height: MediaQuery.of(context).size.height / 2 + 20,
                        width: MediaQuery.of(context).size.width,
                        child: Swiper(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return FruitList(
                              imageIndex: index,
                              contentSummary: index,
                              heroTag: index,
                              title: index,
                              index: index,
                            );
                          },
                          viewportFraction: 0.8,
                          scale: 0.9,
                        )),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.filter_list,
                  color: Colors.black54,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 0;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(13),
                    height: 45,
                    width: 80,
                    decoration: BoxDecoration(
                        color: selected == 0
                            ? confirmOrderButton
                            : Colors.transparent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5))),
                    child: Text(
                      'Fruits',
                      style: TextStyle(
                          color: selected == 0
                              ? Colors.white
                              : Colors.grey.shade500),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(13),
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        color: selected == 1
                            ? confirmOrderButton
                            : Colors.transparent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5))),
                    child: Text(
                      'Vegetables',
                      style: TextStyle(
                          color: selected == 1
                              ? Colors.white
                              : Colors.grey.shade500),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 2;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(13),
                    height: 45,
                    width: 80,
                    decoration: BoxDecoration(
                        color: selected == 2
                            ? confirmOrderButton
                            : Colors.transparent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5))),
                    child: Text(
                      'Drinks',
                      style: TextStyle(
                          color: selected == 2
                              ? Colors.white
                              : Colors.grey.shade500),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: darkCreamBackground,
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
  final imageIndex;
  final index;
  final title;
  final contentSummary;
  final heroTag;
  FruitList(
      {this.imageIndex,
      this.contentSummary,
      this.heroTag,
      this.title,
      this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(
                      index: index,
                    )));
      },
      child: Stack(
        // alignment: Alignment.topRight,

        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Container(
              height: MediaQuery.of(context).size.height * .6666,
              width: MediaQuery.of(context).size.width / 2 - 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: darkCreamBackground),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 30, right: 30, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(titles[title],
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        Text(' Fruit',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(summary[contentSummary])
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
                      color: greenColor,
                      boxShadow: [BoxShadow(color: greenColor, blurRadius: 2)]),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 20,
                  ),
                )),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
                padding: EdgeInsets.only(right: 10, top: 10),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300, blurRadius: 15)
                          ]),
                    ),
                    Container(
                      height: 100,
                      width: 160,
                      child: Hero(
                        tag: hero[heroTag],
                        child: Image(
                          image: AssetImage(images[imageIndex]),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
