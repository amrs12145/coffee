// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:coffe/controller/product.dart';
import 'package:coffe/model/product.dart';
import 'package:coffe/provider.dart/product.dart';
import 'package:coffe/screens/product_details.dart';
import 'package:coffe/shared/bottom_nav.dart';
import 'package:coffe/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primary,
        title: Text('Coffee Shop'),
        actions: [
          Icon(Icons.search),
        ],
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * .6,
        child: Drawer(
          child: Text('Drawer'),
        ),
      ),
      body: Padding(
        padding: Constants.padding,
        child: Column(
          children: [
            Constants.verticleSpacing,
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'it\'s Great',
                    style: Constants.textStyle2,
                  ),
                  TextSpan(
                    text: ' Day For Coffee!',
                    style: Constants.headlineStyle,
                  ),
                ],
              ),
            ),
            Constants.verticleSpacing,
            FutureBuilder(
              future: ProductController.getProduct(),
              builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                if (snapshot.connectionState != ConnectionState.done)
                  return CircularProgressIndicator();

                return Expanded(
                  child: ListView.separated(
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (_, __) => Constants.verticleSpacing,
                    itemBuilder: (context, i) {
                      final Product product = snapshot.data![i];

                      return ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetails(product: product);
                              },
                            ),
                          );
                        },
                        leading: Icon(
                          Provider.products[i % 6].icon,
                          size: 40,
                          color: Colors.brown.shade500,
                        ),
                        title: Text(
                          product.name!,
                          style: Constants.textStyle,
                        ),
                        subtitle: Text(
                          product.price.toString(),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        contentPadding: Constants.padding,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
