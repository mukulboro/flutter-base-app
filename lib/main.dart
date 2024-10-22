import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_base_app/screens/main_screen.dart';
import 'package:flutter_base_app/styles/theme_data.dart';
import 'package:flutter_base_app/providers/language_provider.dart';
import 'package:flutter_base_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // SharedPreferences.setMockInitialValues({});
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final String? languageCode = prefs.getString('language');
  final String? theme = prefs.getString('theme');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(theme: theme ?? 'system')),
        ChangeNotifierProvider(create: (context) => LanguageProvider(languageCode: languageCode ?? 'en'))
      ],
      child: MainApp(
        languageCode: languageCode,
        theme: theme,
      ),
    ),
  );
}

class MainApp extends StatefulWidget {
  final String? languageCode;
  final String? theme;

  const MainApp({
    required this.languageCode,
    required this.theme,
    super.key,
  });

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Base App',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ne')],
      theme: lightThemeData,
      darkTheme: darkThemeData,
      locale: Locale(context.watch<LanguageProvider>().languageCode),
      home: const MainScreen(),
      themeMode: context.watch<ThemeProvider>().getTheme(),
    );
  }
}
