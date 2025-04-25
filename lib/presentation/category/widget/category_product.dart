import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:retail/data/home/model/product_model.dart';
import 'package:retail/presentation/cart/cart_list.dart';
import 'package:retail/presentation/home/home_screen.dart';
import 'package:retail/presentation/home/notifier/home_notifier.dart';
import 'package:retail/presentation/category/widget/product_item.dart';
import 'package:retail/presentation/category/widget/secondary_category_card.dart';
import 'package:retail/presentation/home/widgets/circular_action_button.dart';
import 'package:badges/badges.dart' as badges;

class CategoryProduct extends StatelessWidget {
  const CategoryProduct({super.key, required this.productList});

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeNotifier()..getAllProduct(),
      child: Consumer<HomeNotifier>(builder: (context, provider, child) {
        return Scaffold(
          appBar: _appBar(context, provider),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 15, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    productList.isNotEmpty
                        ? productList.first.categoryName
                        : '',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 112, 60, 60),
                      // shadows: [
                      //   Shadow(
                      //       offset: Offset(-2, -2),
                      //       blurRadius: 3.0,
                      //       color: Color.fromARGB(255, 112, 184, 220))
                      // ]
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  SizedBox(
                      height: 40,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final isSelected =
                                provider.selectedSubCateIndex == index;
                            return SecondaryCategoryCard(
                              product: productList[index],
                              isSelected: isSelected,
                              isSelect: provider.isSelectedSub,
                              index: index,
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                width: 8,
                              ),
                          itemCount: productList.length)),
                  Padding(
                    padding: const EdgeInsets.only(right: 9, top: 3),
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 1,
                            childAspectRatio: 0.78),
                        itemCount: productList.length,
                        itemBuilder: (context, index) {
                          final product = productList[index];
                          return ProductItem(
                            product: product,
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

AppBar _appBar(BuildContext context, HomeNotifier provider) {
  return AppBar(
    elevation: 0.5,
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularActionButton(
              onTap: () {
                AppNavigator.push(
                    context,
                    HomeScreen(
                      allFilterList: [],
                    ));
              },
              hSize: 30,
              wSize: 30,
              child: Icon(Icons.arrow_back_ios)),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: SizedBox(
              height: 38,
              child: TextField(
                controller: provider.searchController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    hintText: 'Search on RetailGo',
                    filled: true,
                    fillColor: Colors.grey[180],
                    prefixIcon: Icon(
                      Icons.search_outlined,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.grey.shade600)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.blue)),
                    suffixIcon: provider.searchController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              provider.searchController.clear();
                            },
                            icon: Icon(Icons.clear))
                        : null),
                onSubmitted: (value) {},
              ),
            ),
          ),
          SizedBox(
            width: 32,
          ),
          // CircularActionButton(
          //     onTap: () => AppNavigator.push(context, CartListPage()),
          //     hSize: 40,
          //     wSize: 40,
          //     color: Colors.grey[300]!,
          //     child: Icon(Icons.shopping_cart_outlined))
          cartBadge(context)
        ],
      ),
    ),
  );
}

Widget cartBadge(BuildContext context) {
  return CircleAvatar(
    radius: 20,
    backgroundColor: Colors.grey[350]!,
    child: badges.Badge(
      position: badges.BadgePosition.topEnd(top: -7, end: -7),
      badgeContent: Text(
        '6',
        style: TextStyle(color: Colors.white),
      ),
      badgeStyle: badges.BadgeStyle(badgeColor: Colors.blue),
      child: IconButton(
          onPressed: () => AppNavigator.push(context, CartListPage()),
          icon: Icon(Icons.shopping_cart_outlined)),
    ),
  );
}
