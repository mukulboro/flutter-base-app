import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_base_app/widgets/settings_button.dart';
import 'package:flutter_base_app/widgets/content_loader.dart';
import 'package:flutter_base_app/providers/language_provider.dart';
import 'package:flutter_base_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _languageHandler(String? value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value != null) {
      setState(() {
        _language = value;
        context
            .read<LanguageProvider>()
            .setLanguage(newLanguageCode: _language);
      });
    }
    await prefs.setString('language', _language);
  }

  void _themeHandler(String? value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value != null) {
      setState(() {
        _theme = value;
        context.read<ThemeProvider>().setTheme(newTheme: _theme);
      });
    }
    await prefs.setString('theme', _theme);
  }

  Future<List> _loadContent() async {
    // await Future.delayed(Duration(seconds: 5));
    setState(() {
      _language = context.read<LanguageProvider>().languageCode;
      _theme = context.read<ThemeProvider>().theme;
    });
    return [1];
  }

  String _language = "en";
  String _theme = "system";

  @override
  Widget build(BuildContext context) {
    return Loader(
      futureFunction: _loadContent(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.settingsScreenTitle),
        ),
        body: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SettingsButton(
                  label: AppLocalizations.of(context)!.settingsLanguageLabel,
                  icon: Icons.language,
                  widget: DropdownButton(items: const [
                    DropdownMenuItem(value: "en", child: Text("English")),
                    DropdownMenuItem(value: "ne", child: Text("नेपाली"))
                  ], value: _language, onChanged: _languageHandler),
                ),
                SettingsButton(
                  label: AppLocalizations.of(context)!.settingsThemeLabel,
                  icon: Icons.format_paint_rounded,
                  widget: DropdownButton(items: [
                    DropdownMenuItem(
                        value: "system",
                        child: Text(
                            AppLocalizations.of(context)!.settingsSystemTheme)),
                    DropdownMenuItem(
                        value: "light",
                        child: Text(
                            AppLocalizations.of(context)!.settingsLightTheme)),
                    DropdownMenuItem(
                        value: "dark",
                        child: Text(
                            AppLocalizations.of(context)!.settingsDarkTheme)),
                  ], value: _theme, onChanged: _themeHandler),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
