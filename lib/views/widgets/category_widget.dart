import 'package:e_commerce_app/model/Category.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  Category category;

  CategoryWidget({required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.network(
                  category.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Spacer(),
                  Stack(
                    children: [
                      Container(
                        height:30,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              category.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
