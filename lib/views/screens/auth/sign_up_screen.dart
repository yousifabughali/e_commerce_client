import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, provider, child)
    {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Sign-In',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Form(
            key: provider.signUpKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: provider.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        label: Text('E-mail'), border: OutlineInputBorder()),
                    validator: provider.emailValidation,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: provider.passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                        label: Text('Password'),
                        border: OutlineInputBorder()),
                    validator: provider.passwordValidation,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: provider.userNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        label: Text('User Name'),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: provider.phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        label: Text('Phone'),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      provider.signUp();
                    },
                    child: Text('Sign Up'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
