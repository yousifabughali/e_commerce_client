import 'package:e_commerce_app/app_router/router.dart';
import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:e_commerce_app/views/screens/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'Sign-In',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: Form(
              key: provider.signInKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    ElevatedButton(
                      onPressed: () {
                        provider.signIn();
                      },
                      child: Text('Sign In'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () {
                        AppRouter.NavigateWithReplacemtnToWidget(SignUpScreen());
                      },
                      child: Text('Don\'t have an account?, Create account.'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        provider.forgetPassword();
                      },
                      child: Text('Forget Password?'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
