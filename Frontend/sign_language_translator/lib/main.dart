import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_language_translator/core/providers/app_providers.dart';
import 'package:sign_language_translator/features/auth/presentation/screens/auth_gate.dart';

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
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const AuthGate(),
    );
  }
}

extension StringCasingExtension on String {
  String get toCapitalized {
    if (isEmpty) return this;
    final firstLetterIndex = indexOf(RegExp(r'[a-zA-Z]'));
    if (firstLetterIndex == -1) return this; // If there are no letters, returns the original string
    return substring(0, firstLetterIndex) +
        this[firstLetterIndex].toUpperCase() +
        substring(firstLetterIndex + 1).toLowerCase();
  }

  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized)
      .join(' ');
}