import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Account Page',
          style: TextStyle(
              color: Color.fromRGBO(10, 132, 255, 1),
              decoration: TextDecoration.none, // Disable underline explicitly
              fontSize: 20)),
    );
  }
}
