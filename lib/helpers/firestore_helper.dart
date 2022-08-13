import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/Category.dart';
import 'package:e_commerce_app/model/user.dart';

class FireStoreHelper {
  FireStoreHelper._();

  static FireStoreHelper fireStoreHelper = FireStoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final String categoryCollectionName = 'categories';

  CollectionReference<Map<String, dynamic>> userCollection = FirebaseFirestore
      .instance.collection('users');
  
  CollectionReference<
      Map<String, dynamic>> categoriesCollection = FirebaseFirestore.instance
      .collection('categories');

  addUsersToFireStore(AppUser appUser) async {
    await userCollection.doc(appUser.id).set(appUser.toMap());
  }

  Future<AppUser> getUserFromFireStore(String id) async {
    DocumentSnapshot<
        Map<String, dynamic>> documentSnapshot = await userCollection.doc(id)
        .get();

    return AppUser.fromMap(documentSnapshot.data()!);
  }

  addNewCategory(Category category) async {
    await categoriesCollection.add(category.toMap());
  }

  deleteCategory(Category category) async {
   await categoriesCollection.doc(category.id);
  }

}
