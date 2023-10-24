import 'package:flutter/material.dart';
import 'package:helzy/services/auth_service.dart';

class AuthProvider extends InheritedWidget {
  final AuthService auth;

  const AuthProvider({Key? key, required Widget child, required this.auth})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AuthProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AuthProvider>();
}
