import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/items_widget1.dart';
import 'cart_screen.dart';

class SingleItemScreen extends StatefulWidget {
  final String img;
  final String itemName;
  late double itemPrice;
  final String itemDescription;
  final Widget itemsWidget;

  SingleItemScreen({
    required this.img,
    required this.itemName,
    required this.itemPrice,
    required this.itemDescription,
    required this.itemsWidget,
  });

  @override
  _SingleItemScreenState createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  int quantity = 1;
  String selectedSize = 'S';
  bool isAddedToFavorites = false;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  void navigateToCartPage() {
    String img = widget.img;
    String itemName = widget.itemName;
    double itemPrice = widget.itemPrice;
    int itemQuantity = quantity;
    String selectedSize = this.selectedSize;
    double totalPrice = widget.itemPrice * quantity;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(
          img: img,
          itemName: itemName,
          itemPrice: itemPrice,
          itemQuantity: itemQuantity,
          selectedSize: selectedSize,
          totalPrice: totalPrice,
        ),
      ),
    );
  }

  void toggleFavorites() {
    setState(() {
      isAddedToFavorites = !isAddedToFavorites;
    });

    String message = isAddedToFavorites
        ? 'Đã thêm vào mục yêu thích của bạn'
        : 'Đã bỏ khỏi mục yêu thích của bạn';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 50, 54, 56),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text(
            'Thông báo',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          content: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE57734),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Text(
                  'Đóng',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.itemPrice * quantity;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Image.asset(
                    widget.img,
                    width: MediaQuery.of(context).size.width / 1.6,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BEST COFFEE",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          letterSpacing: 3,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.itemName,
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 140,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: decrementQuantity,
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      elevation: 0,
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size(36, 36),
                                    ),
                                    child: Icon(
                                      CupertinoIcons.minus,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    quantity.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  ElevatedButton(
                                    onPressed: incrementQuantity,
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      elevation: 0,
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size(36, 36),
                                    ),
                                    child: Icon(
                                      CupertinoIcons.plus,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "\$$totalPrice",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.itemDescription,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.4),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Size :",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          buildSizeRadioButton('S'),
                          SizedBox(
                            width: 10,
                          ),
                          buildSizeRadioButton('M'),
                          SizedBox(
                            width: 10,
                          ),
                          buildSizeRadioButton('L'),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: toggleFavorites,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Icon(
                                isAddedToFavorites
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Color(0xFFE57734),
                                size: 30,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: navigateToCartPage,
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFE57734),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                child: Text(
                                  "Mua ngay",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSizeRadioButton(String size) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selectedSize == size ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        child: Text(
          size,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: selectedSize == size ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
