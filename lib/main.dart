import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traces/core/services/notifications_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:traces/pages/authentication/cubit/authentication_form_notifier.dart';
import 'package:traces/pages/authentication/views/authentication_page.dart';
import 'package:traces/pages/home/layouts/layout.dart';
import 'package:traces/core/utils/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationsService().initialize();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()..init()),
      ChangeNotifierProvider(create: (context) => AuthState()),
    ],
    child: const RootWidget(),
  ));
}

class RootWidget extends StatefulWidget {
  const RootWidget({super.key});

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traces',
      theme: ThemeData.dark(),
      home: AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.isLoading) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CupertinoActivityIndicator()),
      );
    }
    if (authProvider.isAuthenticated) {
      return BaseLayout();
    } else {
      return AuthenticationPage();
    }
  }
}
