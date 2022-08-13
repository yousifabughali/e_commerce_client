import 'package:e_commerce_app/app_router/router.dart';
import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:e_commerce_app/provider/firestore_provider.dart';
import 'package:e_commerce_app/views/screens/lunch_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
    ChangeNotifierProvider<AuthProvider>(
    create: (context)=>AuthProvider(),
    ),
    ChangeNotifierProvider<FireStoreProvider>(
    create: (context)=>FireStoreProvider(),
    ),
      ],

        child: MaterialApp(
          navigatorKey: AppRouter.navKey,
          home: LunchScreen(),
        ),
      );
  }
}
