import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, IconData icon, Function()? tapHandler) {
      return ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        leading: Icon(
          icon,
          size: 36,
          color: Colors.white,
        ),
        onTap: tapHandler,
      );
    }

    return SafeArea(
      child: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        width: MediaQuery.of(context).size.width * 0.75,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(children: [
          buildListTile(
            'User',
            Icons.account_circle_rounded,
            () {},
          ),
          const Divider(thickness: 2),
          buildListTile('Settings', Icons.settings_rounded, () => null),
          buildListTile('Sign out', Icons.exit_to_app_rounded, () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushNamed('/');
          }),
        ]),
      ),
    );
  }
}
