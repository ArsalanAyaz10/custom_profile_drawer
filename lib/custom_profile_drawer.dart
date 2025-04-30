library custom_profile_drawer;

import 'package:flutter/material.dart';

class DrawerMenuItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  DrawerMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}

class CustomProfileDrawer extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;
  final List<DrawerMenuItem> menuItems;

  const CustomProfileDrawer({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    if (!_isInsideDrawer(context)) {
      // If not, throw an error or show a warning
      // return const Center(
      //   child: Padding(
      //     padding: EdgeInsets.all(10.0),
      //     child: Text(
      //       "CustomProfileDrawer must be used inside a Scaffold's drawer property.",
      //       style: TextStyle(color: Colors.red),
      //     ),
      //   ),
      // );
      throw FlutterError(
        'CustomProfileDrawer must be used inside the drawer property of a Scaffold.',
      );
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(name),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
          ...menuItems.map(
            (item) => ListTile(
              leading: Icon(item.icon),
              title: Text(item.label),
              onTap: item.onTap,
            ),
          ),
        ],
      ),
    );
  }
}

bool _isInsideDrawer(BuildContext context) {
  Scaffold? scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
  return scaffold?.drawer != null;
}
