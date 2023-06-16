import 'package:flutter/material.dart';

import 'home_screen.dart';

class CartPage extends StatelessWidget {
  final String img;
  final String itemName;
  final double itemPrice;
  final int itemQuantity;
  final String selectedSize;
  final double totalPrice;

  CartPage({
    required this.img,
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
    required this.selectedSize,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng của tôi'),
        backgroundColor: Color(0xFFE57734),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Image.asset(
                  img,
                  height: 100,
                  width: 100,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tên sản phẩm: $itemName',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        'Giá: \$${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        'Kích cỡ: $selectedSize',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        'Số lượng: $itemQuantity',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 150,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Color.fromARGB(255, 50, 54, 56),
                          title: Text(
                            'Xác nhận',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          content: Text(
                            'Bạn có chắc muốn thanh toán?',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFE57734),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                child: Text(
                                  'Hủy',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFE57734),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                child: Text(
                                  'Thanh toán',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      backgroundColor:
                                          Color.fromARGB(255, 50, 54, 56),
                                      child: Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Nhập thông tin giao hàng:',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                            SizedBox(height: 10.0),
                                            TextField(
                                              decoration: InputDecoration(
                                                hintText: 'Họ và tên',
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(height: 10.0),
                                            TextField(
                                              decoration: InputDecoration(
                                                hintText: 'Địa chỉ',
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(height: 10.0),
                                            TextField(
                                              decoration: InputDecoration(
                                                hintText: 'Số điện thoại',
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(height: 20.0),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pop();
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeScreen()),
                                                );

                                                // Xử lý khi ấn nút "Xác nhận" trong bảng nhập thông tin giao hàng

                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Dialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              255, 50, 54, 56),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            20.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .check_circle_outline,
                                                              color:
                                                                  Colors.green,
                                                              size: 80.0,
                                                            ),
                                                            SizedBox(
                                                                height: 20.0),
                                                            Text(
                                                              'Thanh toán thành công!',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Text('Xác nhận'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.payment),
                  label: Text('Thanh toán'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFE57734),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
