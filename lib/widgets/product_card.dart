import 'package:flutter/material.dart';

import '../models/models.dart';
import '../view/view.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final price = product.variants.first.prices.first;
    final currency = price.currencyCode.toUpperCase();
    final amount = price.amount;

    return SizedBox(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Hero(
              tag: product.id,
              child: Image.network(
                product.thumbnail,
                fit: BoxFit.cover,
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            ListTile(
              isThreeLine: true,
              dense: false,
              title: Text(product.title),
              subtitle: Text(product.description),
              trailing: Chip(
                label: Text('$currency $amount'),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: product),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
