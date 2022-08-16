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

  addNewCategory() async {
    if (selectedImage != null) {
      String imageUrl =
          await StorageHelper.storageHelper.uploadImage(selectedImage!);
      Category category =
          Category(name: categoryNameController.text, imageUrl: imageUrl);
      FireStoreHelper.fireStoreHelper.addNewCategory(category);
      categories.add(category);
    }
  }

  getAllCategories() async {
    categories = await FireStoreHelper.fireStoreHelper.getAllCategories();
    notifyListeners();
  }

  selectImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    selectedImage = File(file!.path);
    notifyListeners();
  }

  updateCategory(Category category) async {
    String? imageUrl;
    if (selectedImage != null) {
      imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
    }
    Category newCategory = Category(
        name: categoryNameController.text,
        imageUrl: imageUrl ?? category.imageUrl);
    newCategory.id = category.id;
    await FireStoreHelper.fireStoreHelper.updateCategory(newCategory);
    int index = categories.indexOf(
        categories.where((element) => element.id == category.id).first);
    categories[index] = newCategory;
    notifyListeners();
  }

  deleteCategory(Category category) async {
    await FireStoreHelper.fireStoreHelper.deleteCategory(category);
    categories.removeWhere((element) => element.id == category.id);
    notifyListeners();
  }

  addNewProduct(String catId) async {
    if (selectedImage != null) {
      String imageUrl =
          await StorageHelper.storageHelper.uploadImage(selectedImage!);
      Product product = Product(
        name: productNameController.text,
        description: productDescriptionController.text,
        price: num.parse(productPriceController.text),
        quantitiy: num.parse(productQuantityController.text),
        image: imageUrl,
      );
      Product newProduct= await FireStoreHelper.fireStoreHelper.addNewProduct(product, catId);
      products.add(newProduct);
    }
  }

  getAllProduct(String catId) async {
    FireStoreHelper.fireStoreHelper.getAllProduct(catId);
    notifyListeners();
  }

  updateProduct(Product product,String catId) async {
    String? imageUrl;
    if (selectedImage != null) {
      imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
    }
    Product newProduct = Product(
      name: productNameController.text,
      description: productDescriptionController.text,
      price: num.parse(productPriceController.text),
      quantitiy: num.parse(productQuantityController.text),
      image: imageUrl?? product.image,
    );
    newProduct.id = product.id;
    await FireStoreHelper.fireStoreHelper.updateProduct(newProduct,catId);
    getAllProduct(catId);
  }

  deleteProduct(Product product, String catId) async {
    await FireStoreHelper.fireStoreHelper.deleteProduct(product, catId);
    products.removeWhere((element) => element.id == product.id);
    notifyListeners();
  }
}
