import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_app_ui/screens/product_details.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text(
          'Deals of Week',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {}),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 30,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      "50 Products found",
                      style: TextStyle(
                        color: Colors.black87,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      color: Colors.black87,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.format_align_center,
                      color: Colors.black87,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height - 130,
              child: _productScreenTile(),
            )
          ],
        ),
      ),
    );
  }

  Widget _productScreenTile() {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return ProductScreenTile();
      },
    );
  }
}

class ProductScreenTile extends StatefulWidget {
  ProductScreenTile({
    Key key,
  }) : super(key: key);

  @override
  _ProductScreenTileState createState() => _ProductScreenTileState();
}

class _ProductScreenTileState extends State<ProductScreenTile> {
  addToCart() {
    Fluttertoast.showToast(
        msg: "Added product Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.white,
        fontSize: 16.0);

    //code for add to your database
  }

  bool _addToCartClicked = false;

  int _counter = 1;

  void _increaseCartItem() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCartItem() {
    if (_counter <= 1) {
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text("Minimum product order is 1"),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    } else {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => ProductDetailsScreen()));
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: 190,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300], offset: Offset(1, 1), blurRadius: 4),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.only(left: 30),
                        child: Image.network(
                          "https://i.dailymail.co.uk/i/pix/2015/01/07/2336DDE600000578-2901160-image-m-3_1420672083842.jpg",
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        )),
                  ),
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.radio_button_checked,
                            size: 20,
                            color: Colors.green,
                          ),
                          Text(
                            "500gm",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Text(
                  "Fresh Fruits",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 1,
                    fontFamily: 'Bengali',
                  ),
                  softWrap: true,
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "৳ 150",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                          decoration: TextDecoration.lineThrough,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Text("৳ 99",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                ),
              ),
              _addToCartClicked
                  ? Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => _decreaseCartItem(),
                            child: Icon(
                              Icons.remove_circle,
                              color: Colors.redAccent,
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
                            child:
                                Icon(Icons.add_circle, color: Colors.redAccent),
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    )
                  : Container(
                      height: 25,
                      width: 100,
                      child: RaisedButton(
                        color: Colors.redAccent,
                        shape: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          addToCart();
                          setState(() {
                            _addToCartClicked = true;
                          });
                        },
                        child: Text(
                          "+ ADD",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
              Container(
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                child: Text(
                  "Standard Delivery",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
