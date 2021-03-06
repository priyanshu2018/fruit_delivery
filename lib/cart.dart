import 'package:flutter/material.dart';
import 'package:fruits/constants.dart';
import 'animation_Text.dart';

class CartItems extends StatefulWidget {
  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> with TickerProviderStateMixin {

  Animation animation1;
  AnimationController controller1;
  Animation animation2;
  AnimationController controller2;

  @override
  void initState() {
    // TODO: implement initState

    controller1 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 6));
    animation1 = Tween<double>(begin: 148, end: 300)
        .animate(CurvedAnimation(parent: controller1, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });
    animation2 = Tween<double>(begin: 130, end: 160)
        .animate(CurvedAnimation(parent: controller2, curve: Curves.elasticOut))
      ..addListener(() {
        setState(() {});
      });

    controller1.forward();
    controller2.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller1.dispose();
    controller2.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey.shade500,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("asset/profile.jpg"),
                )
              ],
            ),
          )
        ],
        elevation: 0,
      ),
      backgroundColor: lightCreamBackground,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10),
                  child: Row(
                    children: <Widget>[
                      Text('My ',style: TextStyle(color: Colors.black, fontSize: 25)),
                      AnimatedText(text: 'Order',fontSize: 25,)
                    ],
                  ),

//                  child: RichText(
//                    text: TextSpan(
//                        text: 'My',
//                        style: TextStyle(fontSize: 25, color: Colors.black87),
//                        children: [
//                          TextSpan(
//                              text: ' Order',
//                              style: TextStyle(
//                                  fontWeight: FontWeight.bold,
//                                  fontSize: 25,
//                                  color: Colors.black87))
//                        ]),
//                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 15,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, top: 10, bottom: 10, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Stack(
                            // alignment: Alignment.topLeft,
                            children: <Widget>[
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    color: darkCreamBackground),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40.0, top: 40),
                                child: Container(
                                  height: animation2.value,
                                  width: animation2.value,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Image(
                                    image: AssetImage(images[index]),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                    text: "\u20B9 ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 30),
                                    children: [
                                      TextSpan(
                                          text: price[index],
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: ".09",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black))
                                    ]),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(names[index],
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black87)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      size: 15,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text("6"),
                                  IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      size: 15,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }, childCount: 3),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 25,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Discount',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Text(
                              '\u20B9 3',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Total : ',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\u20B9 13.00',
                              style: TextStyle(
                                  color: Color(0xFF89A998),
                                  fontSize: 33,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Container(
              height: 60,
              width: animation1.value,
              decoration: BoxDecoration(
                  color: confirmOrderButton,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(27),
                      bottomLeft: Radius.circular(8))),
              child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartItems()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Confirm Order",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
