import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/services.dart';

var kColorscheme = ColorScheme.fromSeed(seedColor: Colors.blueGrey);
var kDarkcolorscheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 5, 99, 125),
);
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
  //   fn,
  // ) {
    runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkcolorscheme,
          cardTheme: CardThemeData(
            color: kDarkcolorscheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkcolorscheme.primaryContainer,
              foregroundColor: kDarkcolorscheme.onPrimaryContainer,
            ),
          ),
        ),
        theme: ThemeData().copyWith(
          colorScheme: kColorscheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorscheme.onPrimaryContainer,
            foregroundColor: kColorscheme.primaryContainer,
          ),
          // scaffoldBackgroundColor: const Color.fromARGB(255, 210, 235, 248),
          cardTheme: CardThemeData(
            color: kColorscheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorscheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kColorscheme.onSecondaryContainer,
              fontSize: 16,
            ),
          ),
        ),
        // themeMode: ThemeMode.system,
        home: Expenses(),
      ),
    );
  // });
}
