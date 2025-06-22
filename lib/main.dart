import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

import './widgets/widgets.dart';
import './views/views.dart';
import 'bindings/initial_binding.dart';

Future<void> main() async {
  // Registrar os services globais

  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init(); // Inicializa o GetStorage
  // Inicializa locale para pt_BR
  await initializeDateFormatting('pt_BR', null);
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
            seedColor: Colors.amber), // Alterado para amarelo
        useMaterial3: true,
        primaryColor: Colors
            .amber[700], // Um tom mais escuro de amarelo para a cor primária
        scaffoldBackgroundColor:
            Colors.white, // Fundo branco para a maioria das telas
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.amber[700], // AppBar em amarelo
          foregroundColor: Colors.black, // Cor do texto e ícones na AppBar
          elevation: 4,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Título da AppBar em preto para contraste
          ),
          iconTheme: const IconThemeData(
              color: Colors.black), // Ícones da AppBar em preto
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.amber[700], // FAB em amarelo
          foregroundColor: Colors.black, // Ícone do FAB em preto
          elevation: 6,
          shape: const StadiumBorder(),
        ),
        cardTheme: CardThemeData(
          color: Colors.white, // Cards em branco
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
          backgroundColor: Colors.amber[700], // Chips em amarelo
          selectedColor: Colors
              .orange, // Cor de seleção para chips (opcional, pode ser ajustado)
          secondarySelectedColor:
              Colors.orange, // Cor secundária de seleção (opcional)
          labelStyle:
              const TextStyle(color: Colors.black), // Texto dos chips em preto
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors
              .amber[700], // Cor do ícone selecionado da BottomNavigationBar
          unselectedItemColor: Colors.grey, // Cor do ícone não selecionado
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.amber[700], // Cor de fundo dos botões elevados
            foregroundColor:
                Colors.black, // Cor do texto e ícones nos botões elevados
          ),
        ),
      ),

      // 👉 TIRA ISSO:
      // home: MainNavigationPage(),

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
