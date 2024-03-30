import 'package:blocks/screens/home_screen.dart';
import 'package:blocks/storage/objectbox.dart';
import 'package:flutter/material.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

late ObjectBox objectBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  loadObjectBoxLibraryAndroidCompat();
  objectBox = await ObjectBox.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color lightModeSeedColor = Colors.indigo.shade600;
    Color darkModeSeedColor = Colors.indigo.shade400;
    return MaterialApp(
      title: 'Blocks',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.indigo, background: Colors.indigo.shade50),
          appBarTheme: const AppBarTheme(
              elevation: 15,
              foregroundColor: Colors.white,
              backgroundColor: Colors.indigo),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: lightModeSeedColor,
              foregroundColor: Colors.indigo.shade50),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 2, color: Colors.black38)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: lightModeSeedColor, width: 2)),
          ),
          sliderTheme: SliderThemeData(
              thumbColor: lightModeSeedColor,
              inactiveTrackColor: Colors.black26),
          useMaterial3: true),
      darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: darkModeSeedColor, brightness: Brightness.dark),
          appBarTheme:
              const AppBarTheme(elevation: 15, backgroundColor: Colors.indigo),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.indigo.shade400,
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 2, color: Colors.white38)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Colors.indigo,
                  width: 2,
                )),
          ),
          sliderTheme: SliderThemeData(
              thumbColor: darkModeSeedColor,
              inactiveTrackColor: Colors.white60,
              activeTrackColor: darkModeSeedColor),
          useMaterial3: true),
      home: const HomeScreen(title: 'Blocks'),
      debugShowCheckedModeBanner: false,
    );
  }
}
