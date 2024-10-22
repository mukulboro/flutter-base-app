# flutter_base_app

A base flutter app that can be cloned and used for projects to boost project setup time in the future.

## Features

### 1. Easy to follow directory structure: ✅
- All necessary `.dart` files inside the `lib` folder
- `l10n` folder containes resource bundles for supported languages.
- `providers` folder containes all required `ChangeNotifier` classes for state management.
- `screens` contains all major screens (or pages) included in the application.
- `styles` folder contains Theme code currently. Can also include custom colors in seperate file if needed.
- `widgets` contains all custom widgets created during development.

### 2. Provider state management setup: ✅
- State management setup using the `provider` package.
- The `main()` function itself has a `MultiProvider` for global state management.
- Currently global state management is setup to handle Theme as well as Language preferences of the user.

### 3. Internationalization support (base template English) : ✅

- Uses the `flutter_localizations` package.
- Currently, setup to use Nepali and English.
- Template for the English language is the base template.


### 4. Dynamic themeing and language support: ✅
- A seperate Settings page to handle these changes.

