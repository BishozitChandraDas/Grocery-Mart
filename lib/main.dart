import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_store/consts/theme_data.dart';
import 'package:grocery_store/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isDark = true;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: Styles.themeData(true, context),
        home: const HomeScreen());
  }
}
