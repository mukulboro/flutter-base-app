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

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  // Get language and theme config from shared preferences if available
  final String? languageCode = prefs.getString('language');
  final String? theme = prefs.getString('theme');
  runApp(
    MultiProvider(
      providers: [
        // if shared preferences is empty, default values (english lang and system theme) will be used
        ChangeNotifierProvider(create: (context) => ThemeProvider(theme: theme ?? 'system')),
        ChangeNotifierProvider(create: (context) => LanguageProvider(languageCode: languageCode ?? 'en'))
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({
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
      // get locale and theme from providers
      locale: Locale(context.watch<LanguageProvider>().languageCode),
      home: const MainScreen(),
      themeMode: context.watch<ThemeProvider>().getTheme(),
    );
  }
}
