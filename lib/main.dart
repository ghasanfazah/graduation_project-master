import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketing_graduation/view/screens/about_screen.dart';
import 'package:marketing_graduation/view/screens/auth/login.dart';
import 'package:marketing_graduation/view/screens/auth/register.dart';
import 'package:marketing_graduation/view/screens/bn_screen.dart';
import 'package:marketing_graduation/view/screens/cart_screen.dart';
import 'package:marketing_graduation/view/screens/chick_internt_screen.dart';
import 'package:marketing_graduation/view/screens/contactus_screen.dart';
import 'package:marketing_graduation/view/screens/help_screen.dart';
import 'package:marketing_graduation/view/screens/home_screen.dart';
import 'package:marketing_graduation/view/screens/notification_screen.dart';
import 'package:marketing_graduation/view/screens/product_screen.dart';
import 'package:marketing_graduation/view/screens/splash_screen.dart';
import 'package:marketing_graduation/view/screens/succes_screen.dart';
import 'package:marketing_graduation/view/screens/view_pager_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


bool? isLogin;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLogin = false;
  } else {
    isLogin = true;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: isLogin == false ? '/view_pager_screen' : '/splash_screen',
      routes: {
        '/login_screen': (context) => const LoginScreen(),
        '/register_screen': (context) => const RegisterScreen(),
        '/splash_screen': (context) => const SplashScreen(),
        '/view_pager_screen': (context) => const ViewPagerScreen(),
        '/home_screen': (context) => const HomeScreen(),
        '/product_screen': (context) => const ProductScreen(),
        '/success_screen': (context) => const SuccessScreen(),
        '/bn_screen': (context) => const BnScreen(),
        '/check_internet_screen': (context) => const ChickInternetScreen(),
        '/about_app_screen': (context) => const AboutScreen(),
        '/notification_screen': (context) => const NotificationScreen(),
        '/contact_as_screen': (context) => const ContactAsScreen(),
        '/help_screen': (context) => const HelpScreen(),
        '/cart_screen': (context) => const CartScreen(),
      },
    );
  }
}
