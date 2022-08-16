import 'package:e_commerce_app/app_router/router.dart';
import 'package:e_commerce_app/helpers/firestore_helper.dart';
import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:e_commerce_app/provider/firestore_provider.dart';
import 'package:e_commerce_app/views/screens/product_screens/add_product.dart';
import 'package:e_commerce_app/views/widgets/category_widget.dart';
import 'package:e_commerce_app/views/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  String catId;
   ProductsScreen(this.catId,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, FireStoreProvider>(
        builder: (context, authProvider, fireStoreProvider, x) {
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
            body: fireStoreProvider.products.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: fireStoreProvider.products.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                  },
                  child: ProductWidget(
                      product: fireStoreProvider.products[index],catId: catId),
                );
              },
            ),
          );
        });
  }
}
