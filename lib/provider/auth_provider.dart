import 'package:e_commerce_app/app_router/router.dart';
import 'package:e_commerce_app/helpers/auth_helper.dart';
import 'package:e_commerce_app/helpers/firestore_helper.dart';
import 'package:e_commerce_app/model/user.dart';
import 'package:e_commerce_app/views/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class AuthProvider extends ChangeNotifier{
  GlobalKey<FormState> signInKey = GlobalKey();
  GlobalKey<FormState> signUpKey = GlobalKey();
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController userNameController= TextEditingController();
  TextEditingController phoneController= TextEditingController();



  nullValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    }
  }

   String? emailValidation(String? value){
    if(!isEmail(value!)){
      return 'Invalid Email';
    }
  }

  String? passwordValidation(String? value){
    if(value!.length < 6){
      return ' must be 6 and more';
    }
  }
  signIn() async {
    if(signInKey.currentState!.validate()) {
      UserCredential? credential= await AuthHelper.authHelper.signIn(
          emailController.text,passwordController.text);
      if (credential!=null){
        AppRouter.NavigateWithReplacemtnToWidget(HomeScreen());

      }
    }
  }
   signUp() async {
    if(signInKey.currentState!.validate()) {
      UserCredential? credential= await AuthHelper.authHelper.signUp(
          emailController.text,passwordController.text);
      AppUser appUser =AppUser(email: emailController.text, userName: userNameController.text, phone: phoneController.text,id: credential!.user!.uid);
      FireStoreHelper.fireStoreHelper.addUsersToFireStore(appUser);
      if (credential!=null){
        AppRouter.NavigateWithReplacemtnToWidget(HomeScreen());

      }
    }
  }

  checkUser(){
    AuthHelper.authHelper.checkUser();
  }

  signOut(){
    AuthHelper.authHelper.signOut();
  }

  forgetPassword(){
    AuthHelper.authHelper.forgetPassword('yousifabughali@gmail.com');
  }
}