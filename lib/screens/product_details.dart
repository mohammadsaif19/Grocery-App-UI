import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    Key key,
  }) : super(key: key);
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool _addCartClicked = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  addToCart() async {
    Fluttertoast.showToast(
      msg: "Added product Successfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.greenAccent,
      textColor: Colors.white,
    );
  }

  int _counter = 1;

  void _increaseCartItem() {
    setState(() {
      _counter++;
      _addCartClicked = false;
    });
  }

  void _decreaseCartItem() {
    if (_counter <= 1) {
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text("Minimum product order is 1"),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    } else {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.orange[200],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.black54,
            ),
            onPressed: () => addToCart(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: _detailsScreenTile(),
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: RaisedButton(
          elevation: 0,
          color: _addCartClicked ? Colors.orange : Colors.orange[200],
          shape: OutlineInputBorder(
            borderSide: BorderSide(
              color: _addCartClicked ? Colors.orange : Colors.orange[200],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            if (_addCartClicked != true) {
              addToCart();
              setState(() {
                _addCartClicked = true;
              });
            }
            return null;
          },
          child: Text(
            _addCartClicked
                ? "Added To Cart".toUpperCase()
                : "Add To Cart".toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: _addCartClicked ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailsScreenTile() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            child: Stack(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.orange[200],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      )),
                ),
                Positioned(
                  child: DetailsImageSlider(),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.topLeft,
            child: Text("Fresh Apple",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.topLeft,
            child: Text("Each (500g - 700g)",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.topLeft,
            child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black38)),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child: Text("৳ 99",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "৳ 150",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                        decoration: TextDecoration.lineThrough,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => _decreaseCartItem(),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.grey)),
                      child: Icon(
                        Icons.remove,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "$_counter",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => _increaseCartItem(),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.grey)),
                      child: Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class DetailsImageSlider extends StatefulWidget {
  const DetailsImageSlider({
    Key key,
  }) : super(key: key);
  @override
  _DetailsImageSliderState createState() => _DetailsImageSliderState();
}

class _DetailsImageSliderState extends State<DetailsImageSlider>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 18.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Carousel(
            boxFit: BoxFit.fill,
            images: [
              Image.network(
                  "https://i.dailymail.co.uk/i/pix/2015/01/07/2336DDE600000578-2901160-image-m-3_1420672083842.jpg"),
              Image.network(
                  "https://www.pngfind.com/pngs/m/595-5952311_permalink-to-90-great-apples-png-this-month.png"),
              Image.network(
                  "https://i7.pngflow.com/pngimage/942/292/png-apple-grape-red-delicious-fruit-food-apple-natural-foods-food-grape-desktop-wallpaper-clipart.png"),
            ],
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(seconds: 1),
            autoplayDuration: Duration(seconds: 3),
            dotSize: 4.0,
            dotIncreasedColor: Colors.orange[200],
            dotColor: Colors.orange,
            dotSpacing: 10.0,
            indicatorBgPadding: 5.0,
            dotBgColor: Colors.transparent,
            borderRadius: true,
            moveIndicatorFromBottom: 180.0,
            noRadiusForIndicator: true,
          )),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
