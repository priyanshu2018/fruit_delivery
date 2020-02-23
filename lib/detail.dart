import 'package:flutter/material.dart';
import 'package:fruits/animation_Text.dart';
import 'constants.dart';
import 'cart.dart';

class Details extends StatefulWidget {
  final index;
  Details({this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> with TickerProviderStateMixin {
  Animation animation1;
  AnimationController controller1;
  Animation animation2;
  AnimationController controller2;
  Color iconColor = Colors.grey.shade700;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller1 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 6));
    animation2 = Tween<double>(begin: 0, end: 60)
        .animate(CurvedAnimation(parent: controller2, curve: Curves.elasticOut))
          ..addListener(() {
            setState(() {});
          });

    Future.delayed(Duration.zero, () {
      animation1 = Tween<double>(
              begin: 150, end: MediaQuery.of(context).size.width - 150)
          .animate(CurvedAnimation(parent: controller1, curve: Curves.ease))
            ..addListener(() {
              setState(() {});
            });
    });

    controller1.forward();
    controller2.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller1.dispose();
    controller2.dispose();
    iconColor = Colors.grey.shade700;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: darkCreamBackground,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.all(0),
                        height: MediaQuery.of(context).size.height / 2 - 30,
                        width: MediaQuery.of(context).size.width,
                        child: Hero(
                          tag: hero[widget.index],
                          child: Image(
                            image: AssetImage(images[widget.index]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black87,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 50, right: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(titles[widget.index],style: TextStyle(color: Colors.black, fontSize: 30)),
                              AnimatedText(text: ' Fruit',fontSize: 30,)

                            ],
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 34,
                                        width: 34,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.white),
                                        child: Center(
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.add,
                                              color: Colors.grey.shade700,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                quantity[widget.index] += 1;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(quantity[widget.index].toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 34,
                                        width: 34,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.white),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.remove,
                                            color: Colors.grey.shade700,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (quantity[widget.index] > 0)
                                                quantity[widget.index] -= 1;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "\u20B9",
                                    style: TextStyle(
                                        color: confirmOrderButton,
                                        fontSize: 25),
                                    children: [
                                      TextSpan(
                                          text: price[widget.index],
                                          style: TextStyle(
                                              color: confirmOrderButton,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: ".00",
                                          style: TextStyle(
                                              color: confirmOrderButton,
                                              fontSize: 25))
                                    ]),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(weight[widget.index]),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            summary[widget.index],
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: iconColor,
                                      blurRadius: 7)
                                ]),
                            height: 50,
                            width: 50,
                            child: IconButton(
                              onPressed: (){
                                setState(() {

                                  iconColor = Colors.red;
                                });
                              },
                              icon: Icon(Icons.favorite_border,
                                color: iconColor,)
                            ),
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(3),

                              height: 60,
                              width: animation1.value,

                              //width: MediaQuery.of(context).size.width-100,
                              decoration: BoxDecoration(
                                  color: confirmOrderButton,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(27),
                                      bottomLeft: Radius.circular(8))),
                              child: OutlineButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CartItems()));
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      "Add to Bucket",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(

                                      Icons.arrow_forward,color: Colors.white,
                                        size: 20,

                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                right: animation2.value,
                child: Padding(
                  //padding: EdgeInsets.only(bottom:animation2.value),
                  padding: const EdgeInsets.only(bottom: 310.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 70,
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(9),
                            bottomLeft: Radius.circular(9)),
                        image: DecorationImage(
                            image: AssetImage('asset/add_to_cart.png'),
                            fit: BoxFit.fill)),
                    child: Text(
                      boxContent[widget.index],
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
