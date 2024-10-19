import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_language_translator/core/providers/app_providers.dart';
import 'package:sign_language_translator/features/home/presentation/screens/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: AppProviders.providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema Traductor de Lengua de Señas Guatemalteco',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
