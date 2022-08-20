import 'package:country_code_picker/country_code_picker.dart';
import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  String? countryCode;
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Sign-Up',
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
                      label: const Text('Email'),
                      prefixIcon: const Icon(
                        Icons.alternate_email_sharp,
                        color: Colors.black,
                        size: 18,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    validator: provider.emailValidation,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: provider.passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      label: const Text('Password'),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                        size: 18,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    validator: provider.passwordValidation,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: provider.userNameController,
                    validator: provider.nullValidation,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: const Text('UserName'),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 18,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: provider.phoneController,
                    validator: provider.nullValidation,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      label: const Text('Phone Number'),
                      prefix: CountryCodePicker(
                        onChanged: (value){
                          countryCode=value.dialCode;
                          // provider.phoneController.text=
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    onPressed: () {
                      provider.signUp(countryCode!);
                    },
                    child: const Text('Sign Up'),
                  ),
                  const SizedBox(
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
