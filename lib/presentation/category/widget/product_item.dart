import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/data/home/model/product_model.dart';
import 'package:retail/presentation/category/widget/star_rating.dart';
import 'package:retail/presentation/home/notifier/home_notifier.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: Colors.grey[200]!)),
            child: InkWell(
              onTap: () {},
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 125,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[300]!, width: 0.33)),
                            image: DecorationImage(
                                image: NetworkImage(product.featuredImage),
                                fit: BoxFit.contain)),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 9),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  product.basePrice.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  product.basePrice.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  '70% OFF',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 7, 121, 215)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 78,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return StarRating();
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          width: 0,
                                        );
                                      },
                                      itemCount: 5),
                                ),
                                Text(
                                  '5.0',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      bottom: 93,
                      right: 15,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(40)),
                        child: IconButton(
                            constraints: BoxConstraints(),
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              provider.addToCart(product);
                            },
                            icon: Icon(
                              Icons.add,
                              size: 15,
                              color: Colors.white,
                            )),
                      )),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
