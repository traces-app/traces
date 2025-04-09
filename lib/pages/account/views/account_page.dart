import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:traces/core/services/authentication_service.dart';
import 'package:traces/pages/authentication/authentication.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isNotificationOn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          const Text(
            'Lithika Damnod',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'l.d.b.dasanayaka@gmail.com',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.grey),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: const Text('Profile', style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.arrow_forward_ios,
                color: Colors.white, size: 17),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.white),
            title: const Text('Change Password',
                style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.arrow_forward_ios,
                color: Colors.white, size: 17),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.location_on, color: Colors.white),
            title: const Text('Saved Addresses',
                style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.arrow_forward_ios,
                color: Colors.white, size: 17), //chaned the icon sizes
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.white),
            title: const Text('Notifications',
                style: TextStyle(color: Colors.white)),
            trailing: Switch(
              value: isNotificationOn,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  isNotificationOn = value;
                });
              },
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle logout
                AuthenticationService(Dio()).logout();
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const AuthenticationPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(10, 132, 255, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
