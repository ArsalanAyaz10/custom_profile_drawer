import 'package:flutter/material.dart';
import 'package:custom_profile_drawer/custom_profile_drawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Custom Profile Drawer Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: CustomProfileDrawer(
        name: 'Arsalan Ayaz',
        email: 'arsalan@example.com',
        imageUrl:
            'https://img.freepik.com/free-vector/smiling-young-man-illustration_1308-174669.jpg?t=st=1746026349~exp=1746029949~hmac=f4eea21a6dd0e763db5840f988a225104192c9dfd14e55600012265c56416d95&w=740',
        menuItems: [
          DrawerMenuItem(
            icon: Icons.person,
            label: 'My Profile',
            onTap: () {
              debugPrint('Tapped Profile');
            },
          ),
          DrawerMenuItem(
            icon: Icons.history,
            label: 'Lost History',
            onTap: () {
              debugPrint('Tapped History');
            },
          ),
          DrawerMenuItem(
            icon: Icons.settings,
            label: "Settings",
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('This is a SnackBar!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(child: Text('Custom Profile Drawer Example')),
    );
  }
}
