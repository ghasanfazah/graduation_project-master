import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:marketing_graduation/core/constant/imageassate.dart';
import 'package:marketing_graduation/data/datasorse/list_data_nav_bar.dart';
import 'package:marketing_graduation/view/screens/bn_controller.dart';
import 'package:marketing_graduation/view/widget/bn_item.dart';

class BnScreen extends StatefulWidget {
  const BnScreen({Key? key}) : super(key: key);

  @override
  State<BnScreen> createState() => _BnScreenState();
}

class _BnScreenState extends State<BnScreen> {
  int _currentIndex = 0;

  bool selectedItem = false;

  @override
  Widget build(BuildContext context) {
    Get.put(BnControllerImp());
    return GetBuilder<BnControllerImp>(
        builder: (controller) => Scaffold(

              body: controller.listPage.elementAt(controller.currentIndex),
              bottomNavigationBar: BottomAppBar(
                elevation: 10,
                height: 70,
                shape: const CircularNotchedRectangle(),
                notchMargin: 10,
                clipBehavior: Clip.antiAlias,
                child: Row(
                  children: [
                    Row(
                      children: [
                        BnItem(
                          onPressed: () {
                            controller.changePage(0);
                          },
                          title: 'Home',
                          bnIcon: Icons.home_outlined,
                          selectItemColor: controller.currentIndex==0?true:false,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        BnItem(
                          onPressed: () {
                            controller.changePage(1);
                          },
                          title: 'Favorite',
                          bnIcon: Icons.favorite_border,
                          selectItemColor: controller.currentIndex==1?true:false,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        BnItem(
                          onPressed: () {
                            controller.changePage(2);
                          },
                          title: 'Setting',
                          bnIcon: Icons.settings_outlined,
                          selectItemColor: controller.currentIndex==2?true:false,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        BnItem(
                          onPressed: () {
                            controller.changePage(3);
                          },
                          title: 'Profile',
                          bnIcon: Icons.person_outline,
                          selectItemColor: controller.currentIndex==3?true:false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  _showBottomSheet(context);
                },
                child: const Icon(
                  Icons.add,
                  size: 28,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,

              // bottomNavigationBar: BottomNavigationBar(
              //   currentIndex: _currentIndex,
              //   elevation: 10,
              //   type: BottomNavigationBarType.fixed,
              //   showSelectedLabels: true,
              //   showUnselectedLabels: false,
              //   unselectedItemColor: Colors.black26,
              //   onTap: (index) {
              //     setState(() {
              //       _currentIndex = index;
              //     });
              //   },
              //   items: const [
              //     BottomNavigationBarItem(
              //       icon: Icon(Icons.home_outlined, size: 25),
              //       activeIcon: Icon(Icons.home, size: 30),
              //       label: 'Home',
              //     ),
              //     BottomNavigationBarItem(
              //       icon: Icon(
              //         Icons.favorite_border,
              //         size: 25,
              //       ),
              //       activeIcon: Icon(
              //         Icons.favorite,
              //         size: 30,
              //       ),
              //       label: 'Favorite',
              //     ),
              //
              //     BottomNavigationBarItem(
              //       icon: Icon(Icons.settings_outlined, size: 25),
              //       activeIcon: Icon(
              //         Icons.settings,
              //         size: 30,
              //       ),
              //       label: 'Cart',
              //     ),
              //     BottomNavigationBarItem(
              //       icon: Icon(
              //         Icons.person_outline,
              //         size: 25,
              //       ),
              //       activeIcon: Icon(
              //         Icons.person,
              //         size: 30,
              //       ),
              //       label: 'Profile',
              //     ),
              //   ],
              // ),
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
                        Navigator.pushReplacementNamed(
                            context, '/login_screen');
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
            ));
  }

  _showBottomSheet(context) {
    return showModalBottomSheet(
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          borderSide: BorderSide(color: Colors.white)),
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          alignment: Alignment.center,
          child: Column(
            children: [
              Image.asset(
                ImageAssets.imageLogo,
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'اضافة منتج',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
