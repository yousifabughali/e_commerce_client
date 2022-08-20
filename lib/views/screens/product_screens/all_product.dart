
import 'package:e_commerce_app/helpers/firestore_helper.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:e_commerce_app/provider/firestore_provider.dart';
import 'package:e_commerce_app/views/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {

  String catId;
  ProductsScreen(this.catId, {Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();



}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {

    return Consumer2<AuthProvider,FireStoreProvider>(
        builder: (context, authProvider,fireStoreProvider, x) {
      return Scaffold(
        appBar: AppBar(
          title: Text('All Products'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: ()async{
              await authProvider.signOut();
            }, icon: Icon(Icons.logout),),
          ],
        ),


        body:ListView.builder(
          shrinkWrap: true,
          itemCount: fireStoreProvider.products.length,
          itemBuilder: (context, index) {
            return ProductWidget(
                product: fireStoreProvider.products[index], catId: widget.catId);
          },
        ),
      );
    });
  }
}
