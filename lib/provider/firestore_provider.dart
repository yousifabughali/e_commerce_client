import 'dart:io';

import 'package:e_commerce_app/helpers/firestore_helper.dart';
import 'package:e_commerce_app/helpers/storage_helper.dart';
import 'package:e_commerce_app/model/Category.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FireStoreProvider extends ChangeNotifier {
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();

  File? selectedImage;
  List<Category> categories = [];
  List<Product> products = [];

  FireStoreProvider() {
    getAllCategories();
  }


  getAllCategories() async {
    categories = await FireStoreHelper.fireStoreHelper.getAllCategories();
    notifyListeners();
  }


  getAllProduct(String catId) async {
    products = await  FireStoreHelper.fireStoreHelper.getAllProduct(catId);
    notifyListeners();
  }
}
