import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/items_widget1.dart';

class SingleItemScreen extends StatefulWidget {
  String img;
  String itemName;
  double itemPrice;
  String itemDescription;
  ItemsWidget1 itemsWidget;

  SingleItemScreen(this.img, this.itemName, this.itemPrice,
      this.itemDescription, this.itemsWidget);

  @override
  _SingleItemScreenState createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  int quantity = 1;

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

  @override
  Widget build(BuildContext context) {
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
                              "\$${widget.itemPrice}",
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
                          Text(
                            "S",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
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
                              onPressed: () {
                                // Xử lý sự kiện khi nút "Thêm vào giỏ hàng" được nhấn
                                // Ví dụ: Thêm sản phẩm vào giỏ hàng
                                String itemName = widget.itemName;
                                double itemPrice = widget.itemPrice;
                                int itemQuantity = quantity;

                                // In thông tin sản phẩm và số lượng
                                print('Tên sản phẩm: $itemName');
                                print('Giá sản phẩm: $itemPrice');
                                print('Số lượng: $itemQuantity');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 50, 54, 56),
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: Text(
                                "Thêm vào giỏ hàng",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xFFE57734),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.white,
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
}
