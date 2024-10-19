import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sign_language_translator/features/translator/presentation/provider/translator_provider.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => TranslatorProvider()),
  ];
}