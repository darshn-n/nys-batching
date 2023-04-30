import 'package:smart_batching/providers/job_provider.dart';
import 'package:smart_batching/screens/account_screen.dart';
import 'package:smart_batching/screens/add_resume_screen.dart';
import 'package:smart_batching/screens/categories/category_list.dart';
import 'package:smart_batching/screens/explore_screen.dart';
import 'package:smart_batching/screens/help_center_screen.dart';
import 'package:smart_batching/screens/home_screen.dart';
import 'package:smart_batching/screens/location_screen.dart';
import 'package:smart_batching/screens/login_screen.dart';
import 'package:smart_batching/screens/main_screen.dart';
import 'package:smart_batching/screens/job_details_screen.dart';
import 'package:smart_batching/screens/wishlist_screen.dart';
import 'package:smart_batching/screens/job_by_category.dart';
import 'package:smart_batching/screens/splash_screen.dart';
import 'package:smart_batching/providers/category_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(
          create: (_) => CategoryProvider(),
        ),
        ListenableProvider(
          create: (_) => ProductProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        LocationScreen.id: (context) => const LocationScreen(),
        MainScreen.id: (context) => const MainScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        ExploreScreen.id: (context) => const ExploreScreen(),
        AddResumeScreen.id: (context) => const AddResumeScreen(),
        WishListScreen.id: (context) => const WishListScreen(),
        AccountScreen.id: (context) => const AccountScreen(),
        CategoryListScreen.id: (context) => const CategoryListScreen(),
        JobDetailsScreen.id: (context) => const JobDetailsScreen(),
        ProductByCategory.id: (context) => const ProductByCategory(),
        HelpCenterScreen.id: (context) => const HelpCenterScreen(),
      },
    );
  }
}
