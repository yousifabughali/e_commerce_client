
import 'package:e_commerce_app/app_router/router.dart';
import 'package:e_commerce_app/model/Category.dart';
import 'package:e_commerce_app/provider/firestore_provider.dart';
import 'package:e_commerce_app/views/screens/update_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
   CategoryWidget({required this.category,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
              child: Image.network(category.imageUrl,fit: BoxFit.cover,)),
          SizedBox(height: 5,),
          Row(
            children: [
              Text(category.name),
              SizedBox(width: 10,),
              Expanded(
                child: ElevatedButton(onPressed: (){
                  Provider.of<FireStoreProvider>(context,listen:false).categoryNameController.text=category.name;
                  AppRouter.NavigateToWidget(UpdateCategory(category: category));
                }, child: Text('update')),

              ),
              SizedBox(width: 10,),
              IconButton(onPressed: (){
                Provider.of<FireStoreProvider>(context,listen:false).deleteCategory(category);

              }, icon: Icon(Icons.delete)),
            ],
          ),
        ],
      ),
    );
  }
}
