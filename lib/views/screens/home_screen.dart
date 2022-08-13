import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:e_commerce_app/provider/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).signOut();
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text('Home'),
              SizedBox(
                height: 10,
              ),
              Text(provider.emailController.text +
                  '\n' +
                  provider.userNameController.text +
                  '\n' +
                  provider.phoneController.text),
              ElevatedButton(
                  onPressed: () {
                    // Provider.of<FireStoreProvider>(context,listen: false).insertNewCategory();
                  },
                  child: Text('Add Category'))
            ],
          ),
        ),
      );
    });
  }
}
