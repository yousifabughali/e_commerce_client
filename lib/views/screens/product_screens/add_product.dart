import 'dart:io';

import 'package:e_commerce_app/helpers/storage_helper.dart';
import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:e_commerce_app/provider/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatelessWidget {
  String catId;
   AddProduct(this.catId,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, FireStoreProvider>(
        builder: (context, authProvider, fireStoreProvider, child) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    authProvider.signOut();
                  },
                  icon: Icon(Icons.logout),
                ),
              ],
            ),
            body: Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      fireStoreProvider.selectImage();
                    },
                    child: fireStoreProvider.selectedImage == null
                        ? CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue,
                    )
                        : CircleAvatar(
                      radius: 50,
                      backgroundImage:
                      FileImage(fireStoreProvider.selectedImage!),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: fireStoreProvider.productNameController,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: fireStoreProvider.productDescriptionController,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.number,

                    controller: fireStoreProvider.productPriceController,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: fireStoreProvider.productQuantityController,
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: () async {
                      fireStoreProvider.addNewProduct(catId);
                    },
                    child: Text('Add New Product'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      XFile? selectedImage =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                      await StorageHelper.storageHelper
                          .uploadImage(File(selectedImage!.path));
                      // Provider.of<FireStoreProvider>(context,listen: false).insertNewCategory();
                    },
                    child: Text('Add Category'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
