import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/constant/imageassate.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Favorite',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: Colors.red),),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.imageLogo,
              width: 120,
              height: 120,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Swip',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Colors.red,
                  ),
                ),
                Text(
                  'Wide',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: Colors.black),
                ),
              ],
            ),
            const Divider(
              endIndent: 25,
              indent: 25,
              thickness: 1,
              height: 70,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/bn_screen');
              },
              title: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              leading: const Icon(
                Icons.home,
                color: Colors.red,
                size: 30,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/notification_screen');
              },
              title: const Text(
                'Notification',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              leading: const Icon(
                Icons.notifications,
                color: Colors.red,
                size: 30,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/cart_screen');
              },
              title: const Text(
                'Cart',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              leading: const Icon(
                Icons.shopping_cart,
                color: Colors.red,
                size: 30,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/help_screen');
              },
              title: const Text(
                'Help',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              leading: const Icon(
                Icons.contact_support,
                color: Colors.red,
                size: 30,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/about_app_screen');
              },
              title: const Text(
                'About App',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              leading: const Icon(
                Icons.note_rounded,
                color: Colors.red,
                size: 30,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/login_screen');
              },
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
                size: 30,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),

    );
  }
}
