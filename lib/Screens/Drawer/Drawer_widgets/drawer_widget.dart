import 'package:flutter/material.dart';
import 'package:teknia/Data/Shared/Components/reusable_components.dart';
import 'package:teknia/Data/Shared/Styles/icon_broken.dart';
import 'package:teknia/Screens/Drawer/Drawers_screens/alasnaf_screen.dart';
import 'package:teknia/Screens/Drawer/Drawers_screens/almandobeen.dart';
import 'package:teknia/Screens/Drawer/Drawers_screens/almowrdin_screen.dart';
import 'package:teknia/Screens/HomeScreens/alamlaa_screen.dart';
import 'package:teknia/Screens/HomeScreens/mabiaat_screen.dart';
import 'package:teknia/Screens/HomeScreens/moshtraiat.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white60,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: padding,
                child: Column(
                  children: [
                    const SizedBox(height: 70),
                    buildMenuItem(
                      text: 'الاصناف',
                      icon: IconBroken.Category,
                      onClicked: () => selectedItem(context, 0),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'العملاء',
                      icon: Icons.people_outline,
                      onClicked: () => selectedItem(context, 1),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'المندوبين',
                      icon: IconBroken.Profile,
                      onClicked: () => selectedItem(context, 2),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'الموردين',
                      icon: Icons.person_outlined,
                      onClicked: () => selectedItem(context, 3),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'مبيعات',
                      icon: Icons.shop_2_outlined,
                      onClicked: () => selectedItem(context, 4),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'مشتريات',
                      icon: IconBroken.Buy,
                      onClicked: () => selectedItem(context, 5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.deepPurple;
    const hoverColor = Colors.deepPurple;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        navigateTo(context, TypesScreen());
        break;

      case 1:
        navigateTo(context, CustomerDebts());
        break;

      case 2:
        navigateTo(context, RepresentativeScreen());
        break;

      case 3:
        navigateTo(context, SupplierScreen());
        break;
      case 4:
        navigateTo(context, SalesScreen());
        break;
      case 5:
        navigateTo(context, purchasesScreen());
        break;
    }
  }
}
