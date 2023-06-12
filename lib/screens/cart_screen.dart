// cart_page.dart
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final String itemName;
  final double itemPrice;
  final int itemQuantity;
  final String selectedSize;
  final double totalPrice;

  CartPage({
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
        title: Text('Giỏ hàng'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sản phẩm trong giỏ hàng',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Tên sản phẩm: $itemName',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Giá: \$${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Kích cỡ: $selectedSize',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Số lượng: $itemQuantity',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Xác nhận'),
                      content: Text('Bạn có chắc muốn thanh toán?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Hủy'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Thanh toán'),
                          onPressed: () {
                            // Thực hiện thanh toán ở đây
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Thanh toán'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
