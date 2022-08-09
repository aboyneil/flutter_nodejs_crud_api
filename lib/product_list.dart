import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_nodejs_crud_api/models/product_model.dart';
import 'package:flutter_nodejs_crud_api/product_item.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<ProductModel> products = List<ProductModel>.empty(growable: true);

  @override
  void initState() {
    super.initState();

    products.add(ProductModel(
      id: "1",
      productName: "Red Horse",
      productImage:
          "assets/images/noimage.png",
      productPrice: 500,
    ));

    products.add(ProductModel(
      id: "2",
      productName: "San Mig",
      productImage:
          "assets/images/noimage.png",
      productPrice: 400,
    ));
  }

  Widget productList(products) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.green,
                  minimumSize: const Size(88, 36),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/add-product");
                },
                child: const Text("Add Product"),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    model: products[index],
                    onDelete: (ProductModel model) {},
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NodeJS - CRUD App"),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: productList(products),
    );
  }
}
