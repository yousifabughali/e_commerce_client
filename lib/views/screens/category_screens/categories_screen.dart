
import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:e_commerce_app/provider/firestore_provider.dart';
import 'package:e_commerce_app/views/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../product_screens/all_product.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider,FireStoreProvider>(
        builder: (context, authProvider,fireStoreProvider, x) {
      return Scaffold(
        appBar: AppBar(
          title: Text('All Categories'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: ()async{
              await authProvider.signOut();
            }, icon: Icon(Icons.logout),),
          ],
        ),

        body: ListView.builder(
                itemCount: fireStoreProvider.categories.length,
                itemBuilder: (context, index) {
                  return  InkWell(
                    onTap: () async {
                      await fireStoreProvider.getAllProduct(fireStoreProvider.categories[index].id!);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsScreen(fireStoreProvider.categories[index].id!)));
                      // AppRouter.NavigateToWidget(ProductsScreen(
                      //     fireStoreProvider.categories[index].id!));
                    },
                    child: CategoryWidget(
                        category: fireStoreProvider.categories[index]),
                  );
                },
              ),
      );
    });
  }
}
