import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/search_screen.dart/notifier/search_screen_provider.dart';
import 'package:retail/presentation/search_screen.dart/notifier/widget/filter_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.allFilterList});

  final List<String> allFilterList;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchScreenProvider(),
      child: Consumer<SearchScreenProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: _appBar(context),
            body: Padding(
              padding: EdgeInsets.only(
                top: 5,
                left: 15,
                right: 10,
              ),
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      searchBar(context, provider),
                      SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return FilterItem(item: allFilterList[index]);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 8,
                              );
                            },
                            itemCount: allFilterList.length),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

AppBar _appBar(BuildContext context) {
  return AppBar(
    title: Text('Search'),
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 23),
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            width: 35,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Color(0xFFE0E0E0), borderRadius: BorderRadius.circular(10)),
            child: Icon(
              Icons.settings,
              size: 20,
              color: Color(0xFF424242),
            ),
          ),
        ),
      )
    ],
  );
}

Widget searchBar(BuildContext context, SearchScreenProvider provider) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: TextField(
              controller: provider.searchController,
              decoration: InputDecoration(
                  hintText: 'Search...',
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  prefixIcon: Icon(Icons.search_outlined)),
              onChanged: (value) {},
            ),
          ),
        ),
        SizedBox(
          width: 25,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 38,
            width: 38,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Color(0xFFE0E0E0)),
            child: Icon(
              Icons.filter_list,
              color: Color(0xFF424242),
              size: 20,
            ),
          ),
        )
      ],
    ),
  );
}
