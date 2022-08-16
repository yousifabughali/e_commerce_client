
import 'package:e_commerce_app/app_router/router.dart';
import 'package:e_commerce_app/model/Category.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/provider/firestore_provider.dart';
import 'package:e_commerce_app/views/screens/update_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  String catId;
  ProductWidget({required this.product,required this.catId,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(product.image,fit: BoxFit.cover,)),
          SizedBox(height: 5,),
          Row(
            children: [
              Text(product.name),
              SizedBox(width: 10,),
              Expanded(
                child: ElevatedButton(onPressed: (){
                  Provider.of<FireStoreProvider>(context,listen:false).productNameController.text=product.name;
                  Provider.of<FireStoreProvider>(context,listen:false).productDescriptionController.text=product.name;
                  Provider.of<FireStoreProvider>(context,listen:false).productPriceController.text=product.name;
                  Provider.of<FireStoreProvider>(context,listen:false).productQuantityController.text=product.name;
                  // AppRouter.NavigateToWidget(UpdateProduct(product: product,id: catId));
                }, child: Text('update')),

              ),
              SizedBox(width: 10,),
              IconButton(onPressed: (){
                Provider.of<FireStoreProvider>(context,listen:false).deleteProduct(product,catId);

              }, icon: Icon(Icons.delete)),
            ],
          ),
        ],
      ),
    );
  }
}
