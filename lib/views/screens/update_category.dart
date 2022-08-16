import 'dart:io';

import 'package:e_commerce_app/helpers/storage_helper.dart';
import 'package:e_commerce_app/model/Category.dart';
import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:e_commerce_app/provider/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UpdateCategory extends StatelessWidget {
  Category category;

  UpdateCategory({required this.category, Key? key}) : super(key: key);

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
                  backgroundImage: NetworkImage(category.imageUrl),
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
                controller: fireStoreProvider.categoryNameController,
              ),
              ElevatedButton(
                onPressed: () async {
                  fireStoreProvider.updateCategory(category);
                },
                child: Text('Update Category'),
              ),

            ],
          ),
        ),
      );
    });
  }
}
