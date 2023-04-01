import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myproject_app/ui/authentication/user_data_manager.dart';
import 'package:myproject_app/ui/cart/cart_page.dart';
import 'package:myproject_app/ui/home_page.dart';
import 'ui/welcome_page.dart';
import 'package:provider/provider.dart';
import 'ui/food_home_page_manager.dart';
import 'ui/products/categories_product_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserDataManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => FoodHomePageManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesProductManager(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // scaffoldBackgroundColor: const Color(0xff2b2b2b),
          appBarTheme: const AppBarTheme(
            color: Color(0xff2b2b2b),
          ),
        ),
        home: const SafeArea(
          child: HomePage(),
        ),
      ),
    );
  }
}
