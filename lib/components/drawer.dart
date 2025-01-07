import 'package:flutter/material.dart';

class MyDrawe extends StatelessWidget {
  const MyDrawe({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Material(
            child: DrawerHeader(
              decoration: const BoxDecoration(border: null),
              margin: EdgeInsets.zero, // Removes default margin
              child: Center(
                child: Icon(
                  Icons.note,
                  size: 20,
                  color: Colors.grey[900],
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.grey[700]),
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.grey[700]),
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}
