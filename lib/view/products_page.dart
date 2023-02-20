import 'package:flutter/material.dart';

import '../models/models.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medusa Store')),
      body: FutureBuilder<List<Product>>(
        future: ApiService().getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data!;

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}', textAlign: TextAlign.center),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
