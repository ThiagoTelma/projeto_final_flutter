import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

import './widgets/widgets.dart';
import './views/views.dart';
import 'bindings/initial_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init(); // Inicializa o GetStorage
  await initializeDateFormatting('pt_BR', null); // Inicializa locale para pt_BR
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loja de Produtos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green.shade800, // Changed to dark green
        ),
        useMaterial3: true,
        primaryColor: Colors
            .green.shade800, // A darker shade of green for the primary color
        scaffoldBackgroundColor:
            Colors.white, // White background for most screens
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green.shade900, // AppBar in a very dark green
          foregroundColor:
              Colors.white, // Text and icon color on AppBar to white
          elevation: 4,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white, // AppBar title in white for contrast
          ),
          iconTheme:
              const IconThemeData(color: Colors.white), // AppBar icons in white
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.green.shade700, // FAB in green
          foregroundColor: Colors.white, // FAB icon in white
          elevation: 6,
          shape: const StadiumBorder(),
        ),
        cardTheme: CardThemeData(
          color: Colors.white, // Cards in white
          elevation: 6,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
          bodySmall: TextStyle(fontSize: 12, color: Colors.black54),
          titleLarge: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: Colors.green.shade700, // Chips in green
          selectedColor:
              Colors.lightGreen, // Selection color for chips (optional)
          secondarySelectedColor:
              Colors.lightGreen, // Secondary selection color (optional)
          labelStyle:
              const TextStyle(color: Colors.white), // Chip text in white
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors
              .green.shade800, // Selected icon color for BottomNavigationBar
          unselectedItemColor: Colors.grey, // Unselected icon color
          backgroundColor: Colors.white, // Set background to white
          elevation: 8,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.green.shade700, // Background color for elevated buttons
            foregroundColor: Colors.white, // Text and icons on elevated buttons
          ),
        ),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const MainNavigationPage(),
          binding: InitialBinding(),
        ),
        GetPage(name: '/cart', page: () => CartPage()),
        GetPage(name: '/category/:category', page: () => CategoryPage()),
        GetPage(name: '/signup', page: () => const SignUpPage()),
        GetPage(name: '/login', page: () => const LoginPage()),
      ],
    );
  }
}
