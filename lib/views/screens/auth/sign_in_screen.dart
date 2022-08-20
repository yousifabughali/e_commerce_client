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
          resizeToAvoidBottomInset: false,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Colors.black,
                            size: 18,
                          ),
                          label: const Text('Password'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        validator: provider.passwordValidation,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {
                          provider.signIn();
                        },
                        child: const Text('Sign In'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        onPressed: () {
                          AppRouter.NavigateWithReplacemtnToWidget(
                               SignUpScreen());
                        },
                        child: const Text('Don\'t have an account?, Create account.'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          provider.forgetPassword();
                        },
                        child: const Text('Forget Password?'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
