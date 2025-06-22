import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String category;
  final VoidCallback onTap;

  const CategoryTile({super.key, required this.category, required this.onTap});

  // Helper to translate category names
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
    final String displayedCategory = _getCategoryNameInPortuguese(category);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(
          color: Theme.of(context)
              .primaryColor, // Use theme's primary color (dark green)
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            displayedCategory.toUpperCase(),
            style: const TextStyle(
              color: Colors.white, // Text in white
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
