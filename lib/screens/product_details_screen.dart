import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hw_day8/constants/colors.dart';
import 'package:hw_day8/models/product_model.dart';

List<ProductModel> cartItems = [];

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.mocha,
            shadows: [
              Shadow(
                offset: const Offset(1, 1),
                blurRadius: 2,
                color: AppColors.mocha.withOpacity(0.5),
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.latte,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.thumbnail ?? "",
                height: 200,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 100);
                },
              ),
            ),
            const SizedBox(height: 20),

            Text(
              product.title ?? '',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.mocha,
                shadows: [
                  Shadow(
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    color: AppColors.mocha.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            Text(
              '\$${product.price?.toStringAsFixed(2) ?? "0.00"}',
              style:  GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.latte,
                shadows: [
                  Shadow(
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    color: AppColors.mocha.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            if (product.description != null)
              Text(product.description!, style: GoogleFonts.poppins(fontSize: 16, color: AppColors.mocha)),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  cartItems.add(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Added to cart")),
                  );
                },
                child: Text(
                  "Add to Cart",
                  style:  GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.mocha,
                shadows: [
                  Shadow(
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    color: AppColors.mocha.withOpacity(0.5),
                  ),
                ],
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
