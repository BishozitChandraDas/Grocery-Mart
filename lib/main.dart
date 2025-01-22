import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_store/consts/theme_data.dart';
import 'package:grocery_store/inner_screens/feeds_screen.dart';
import 'package:grocery_store/inner_screens/on_sale_screen.dart';
import 'package:grocery_store/inner_screens/product_details_screen.dart';
import 'package:grocery_store/provider/dark_theme_provider.dart';
import 'package:grocery_store/screens/auth/forget_password_screen.dart';
import 'package:grocery_store/screens/auth/login_screen.dart';
import 'package:grocery_store/screens/auth/register_screen.dart';
import 'package:grocery_store/screens/bottom_bar.dart';
import 'package:grocery_store/screens/orders/orders_screen.dart';
import 'package:grocery_store/screens/viewed/viewed_recently_screen.dart';
import 'package:grocery_store/screens/wishlist/wishlist_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const LoginScreen(),
            routes: {
              OnSaleScreen.routeName: (ctx) => const OnSaleScreen(),
              FeedsScreen.routeName: (ctx) => const FeedsScreen(),
              ProductDetailsScreen.routeName: (ctx) => const ProductDetailsScreen(),
              WishlistScreen.routeName: (ctx) => const WishlistScreen(),
              OrdersScreen.routeName: (ctx) => const OrdersScreen(),
              ViewedRecentlyScreen.routeName: (ctx) => const ViewedRecentlyScreen(),
              LoginScreen.routeName: (ctx) => const LoginScreen(),
              RegisterScreen.routeName: (ctx) => const RegisterScreen(),
              ForgetPasswordScreen.routeName: (ctx) => const ForgetPasswordScreen(),
              
            });
      }),
    );
  }
}
