import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:model/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> product = List.generate(60, (index) {
      return Product(
          title: faker.food.restaurant(),
          imageUrl: 'https://picsum.photos/id/$index/300/300',
          price: 1 + Random().nextInt(999));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Model'),
      ),
      body: GridView.builder(
        itemCount: product.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 5, crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(product[index].imageUrl),
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    product[index].title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rp. ${product[index].price}.000',
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.comment,
                        color: Colors.green,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
