import 'package:e_commerce_app/model/product.dart';

import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  String? catId;

  ProductWidget({required this.product, required this.catId, Key? key})
      : super(key: key);

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
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  const Spacer(),
                  Stack(
                    children: [
                      Container(
                        height: 30,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.name,
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
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
