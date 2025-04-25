import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:badges/badges.dart' as badges;
import 'package:retail/presentation/cart/cart_list.dart';
import 'package:retail/presentation/category/widget/product_item.dart';
import 'package:retail/presentation/filter/widget/selected_filter_list.dart';
import 'package:retail/presentation/home/notifier/home_notifier.dart';
import 'package:retail/presentation/home/widgets/category_item.dart';
import 'package:retail/presentation/filter/filter_container.dart';
import 'package:retail/presentation/home/widgets/home_filter_item.dart';
import 'package:retail/presentation/order/order_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.allFilterList});

  final List<String> allFilterList;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeNotifier()..getAllProduct(),
        child: Consumer<HomeNotifier>(builder: (context, provider, child) {
          return Scaffold(
            appBar: _appBar(context, provider),
            body: Padding(
              padding: const EdgeInsets.only(top: 12, left: 9, right: 2),
              child: Center(
                child: Column(
                  children: [
                    searchTextBox(context, provider),
                    SizedBox(
                      height: 10,
                    ),
                    if (allFilterList.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'YOUR FILTER',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      height: 30,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return HomeFilterItem(
                              selectSubCategories: allFilterList[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 10,
                            );
                          },
                          itemCount: allFilterList.length),
                    ),

                    // Container(
                    //   alignment: Alignment.center,
                    //   height: 45,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //       // color: Colors.greenAccent.withOpacity(0.2),
                    //       borderRadius: BorderRadius.circular(15)),
                    //   child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       itemCount: provider.productList.length,
                    //       itemBuilder: (context, index) {
                    //         final product = provider.productList[index];
                    //         final isSelected = provider.selectedIndex == index;
                    //         return CategoryItem(
                    //           product: product,
                    //           isSelected: isSelected,
                    //           isSelect: provider.isSelected,
                    //           index: index,
                    //         );
                    //       }),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: SingleChildScrollView(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 1,
                                        mainAxisSpacing: 0,
                                        childAspectRatio: 0.8),
                                itemCount: provider.productList.length,
                                itemBuilder: (context, index) => ProductItem(
                                    product: provider.productList[index])),
                          ],
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}

Widget searchTextBox(BuildContext context, HomeNotifier provider) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 38,
        width: 290,
        child: TextField(
          controller: provider.searchController,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              hintText: 'Search on RetailGo',
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              filled: true,
              fillColor: Colors.grey[200],
              prefixIcon: Icon(Icons.search),
              suffixIcon: provider.searchController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        provider.searchController.clear();
                      },
                      icon: Icon(Icons.clear))
                  : null,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: BorderSide(color: Colors.grey[300]!)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: BorderSide(color: Colors.blue))),
          onSubmitted: (value) {},
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8, right: 2),
        child: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.blue),
          child: IconButton(
              constraints: BoxConstraints(),
              padding: EdgeInsets.zero,
              onPressed: () {
                provider.showBottomSheet(context, FilterContainer());
              },
              icon: Icon(
                Icons.filter_list,
                color: Colors.white,
                size: 17,
              )),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.blue),
          child: IconButton(
              constraints: BoxConstraints(),
              padding: EdgeInsets.zero,
              onPressed: () {
                AppNavigator.push(context, OrderScreen());
              },
              icon: Icon(
                Icons.history,
                color: Colors.white,
                size: 16,
              )),
        ),
      )
    ],
  );
}

AppBar _appBar(BuildContext context, HomeNotifier provider) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            // CircularActionButton(
            //     onTap: () {},
            //     hSize: 32,
            //     wSize: 32,
            //     color: Colors.grey[300]!,
            //     child: Icon(
            //       color: Colors.black,
            //       Icons.account_circle_outlined,
            //       size: 26,
            //     )),
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/RetailLogo.jpg',
                      ),
                      fit: BoxFit.contain)),
            ),
          ],
        ),
        Row(
          children: [
            circleBadge(
                context,
                IconButton(
                    onPressed: () => AppNavigator.push(context, CartListPage()),
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 21,
                    ))),
            SizedBox(
              width: 4,
            ),
            circleBadge(
                context,
                IconButton(
                    onPressed: () => AppNavigator.push(context, CartListPage()),
                    icon: Icon(
                      Icons.notifications_active_outlined,
                      size: 23,
                    )))
          ],
        )
      ],
    ),
  );
}

Widget circleBadge(BuildContext context, Widget child) {
  return CircleAvatar(
    radius: 19,
    backgroundColor: Colors.white,
    child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -4, end: -4),
        badgeContent: Text(
          '6',
          style: TextStyle(color: Colors.white, fontSize: 9),
        ),
        badgeStyle: badges.BadgeStyle(badgeColor: Colors.red),
        child: child),
  );
}
