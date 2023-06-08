import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/screens/single_item_screen.dart';

class ItemsWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Text('Không tìm nạp được dữ liệu');
        }

        final products = snapshot.data?.docs ?? [];

        if (products.isEmpty) {
          return Text('Không có sản phẩm nào');
        }

        return GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: (150 / 195),
          children: [
            for (int i = 0; i < products.length; i++)
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF212325),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleItemScreen(
                              img: products[i].get('imageAssetPath'),
                              itemName: products[i].get('name'),
                              itemPrice: products[i].get('price'),
                              itemDescription: products[i].get('description'),
                              itemsWidget: ItemsWidget1(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Image.asset(
                          products[i].get('imageAssetPath'),
                          width: 120,
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[i].get('name'),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Best Coffee",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${products[i].get('price')}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFE57734),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              CupertinoIcons.add,
                              size: 20,
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
        );
      },
    );
  }
}
