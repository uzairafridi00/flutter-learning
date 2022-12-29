import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
    );
  }
}
