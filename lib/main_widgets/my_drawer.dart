import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:helzy/providers/user_provider.dart';
import 'package:helzy/services/auth_service.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final UserProvider userProvider = UserProvider();
  String? _userName;

  @override
  void initState() {
    loadUserData();
    super.initState();
  }

  Future<void> loadUserData() async {
    await userProvider.loadUserData();
    _userName = userProvider.user.name;
    log('look ${userProvider.user.toString()}');
    setState(() {});
  }

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
            _userName!,
            Icons.account_circle_rounded,
            () {},
          ),
          const Divider(thickness: 2),
          buildListTile('Settings', Icons.settings_rounded, () => null),
          buildListTile('Sign out', Icons.exit_to_app_rounded, () async {
            AuthService().signOut();
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushNamed('/');
          }),
        ]),
      ),
    );
  }
}
