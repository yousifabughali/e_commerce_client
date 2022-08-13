import 'package:e_commerce_app/app_router/router.dart';
import 'package:e_commerce_app/helpers/firestore_helper.dart';
import 'package:e_commerce_app/model/user.dart';
import 'package:e_commerce_app/views/screens/auth/sign_in_screen.dart';
import 'package:e_commerce_app/views/screens/home_screen.dart';
import 'package:e_commerce_app/views/widgets/custom_widget_dialoge.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper{
  AuthHelper._();
  static AuthHelper authHelper=AuthHelper._();
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;

  Future<UserCredential?> signUp(String emailAddress,String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomDialog.showDialogFunction('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CustomDialog.showDialogFunction('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

  }
  Future<UserCredential?> signIn(String emailAddress,String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomDialog.showDialogFunction('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CustomDialog.showDialogFunction('Wrong password provided for that user.');
      }
    }

  }

  Future<AppUser?> checkUser() async {
    User? user = await FirebaseAuth.instance.currentUser;
    if (user == null) {
       AppRouter.NavigateWithReplacemtnToWidget(SignInScreen());
       return null;
    } else {
      AppUser appUser= await FireStoreHelper.fireStoreHelper.getUserFromFireStore(user.uid);
      return appUser;
       // AppRouter.NavigateWithReplacemtnToWidget(HomeScreen());

    }
  }

  verifyEmail(){
    User? user = firebaseAuth.currentUser;
    user?.sendEmailVerification();
  }

  forgetPassword( String email) async{
    await firebaseAuth.sendPasswordResetEmail(email: email);

  }

  signOut() async{
    await firebaseAuth.signOut();
    AppRouter.NavigateWithReplacemtnToWidget(SignInScreen());

  }
}