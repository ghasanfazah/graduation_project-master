
import 'package:marketing_graduation/data/model/bn_item.dart';
import 'package:marketing_graduation/view/screens/favorite_screen.dart';
import 'package:marketing_graduation/view/screens/home_screen.dart';
import 'package:marketing_graduation/view/screens/profile_screen.dart';
import 'package:marketing_graduation/view/screens/setting_screen.dart';

List<BnItem> bnItem=[
  BnItem(title: 'Swipwide', widgetScreen: const HomeScreen()),
  BnItem(title: 'Favorite', widgetScreen: const FavoriteScreen()),
  BnItem(title: 'Setting', widgetScreen: const SettingScreen()),
  BnItem(title: 'Profile', widgetScreen: const ProfileScreen()),
] ;