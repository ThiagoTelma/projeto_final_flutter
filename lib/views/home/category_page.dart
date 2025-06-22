import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './../../controllers/controllers.dart';
import '../views.dart'; // Ensure this import is present for ProductCard

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  final ProductController categoryController = Get.find<ProductController>();

  // Helper to translate category names (duplicate from CategoryTile for consistency)
  String _getCategoryNameInPortuguese(String englishName) {
    switch (englishName.toLowerCase()) {
      case 'smartphones':
        return 'Celulares';
      case 'beauty':
        return 'Beleza';
      case 'kitchen-accessories':
        return 'Cozinha';
      case 'mobile-accessories':
        return 'Acessorios de Celular';
      case 'sports-accessories':
        return 'Acessorios de Esportes';
      case 'laptops':
        return 'Notebooks';
      case 'vehicle':
        return 'Veículos';
      case 'fragrances':
        return 'Perfumaria';
      case 'skincare':
        return 'Cuidados com a Pele';
      case 'groceries':
        return 'Mercearia';
      case 'home-decoration':
        return 'Decoração de Casa';
      case 'furniture':
        return 'Móveis';
      case 'tops':
        return 'Blusas';
      case 'womens-dresses':
        return 'Vestidos Femininos';
      case 'womens-shoes':
        return 'Sapatos Femininos';
      case 'mens-shirts':
        return 'Camisas Masculinas';
      case 'mens-shoes':
        return 'Sapatos Masculinos';
      case 'mens-watches':
        return 'Relógios Masculinos';
      case 'womens-watches':
        return 'Relógios Femininos';
      case 'womens-bags':
        return 'Bolsas Femininas';
      case 'womens-jewellery':
        return 'Jóias Femininas';
      case 'sunglasses':
        return 'Óculos de Sol';
      case 'automotive':
        return 'Automotivo';
      case 'motorcycle':
        return 'Motocicletas';
      case 'lighting':
        return 'Iluminação';
      default:
        return englishName; // Returns original if no translation found
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoria = Uri.decodeComponent(Get.parameters['category'] ?? '');

    // Dispara o carregamento ao entrar na página
    categoryController.fetchProductsByCategory(categoria);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Categoria: ${_getCategoryNameInPortuguese(categoria)}'), // Use translated name for title
      ),
      body: Obx(() {
        if (categoryController.carregando.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (categoryController.erro.isNotEmpty) {
          return Center(child: Text(categoryController.erro.value));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.75,
          ),
          itemCount: categoryController.productList.length,
          itemBuilder: (context, index) {
            final produto = categoryController.productList[index];
            return ProductCard(
              cartAnimationMethod: (p0) {}, // Placeholder for now
              product: produto,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: produto),
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
