import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/models/news_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  // List to display (filtered)
  List<NewsArticle> _filteredItems = [];

  // Search query
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list to display all items
    // _filteredItems = cardJsonItems.map((item)=>NewsArticle.fromJson(item)).toList();
  }

  // Function to filter the list based on the search query
  void _filterItems(String query) {
    // final searchList=cardJsonItems.map((item)=>NewsArticle.fromJson(item)).toList();
    // final filtered = searchList
    //     .where((item) => item.title!.toLowerCase().contains(query.toLowerCase()))
    //     .toList();
    //
    // setState(() {
    //   _searchQuery = query;
    //   _filteredItems = filtered;
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 30,),
                searchHeader(),
                SizedBox(height: 6,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: _filteredItems.isEmpty
                        ? Center(
                      child: Text(
                        'No items found',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                        : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _filteredItems.length,
                      itemBuilder: (context, index) {
                        NewsArticle itemCard=_filteredItems[index];
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ListTile(
                            tileColor: Colors.grey[200],
                            onTap: () {

                            },
                            leading: SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.asset(itemCard.url!),
                            ),
                            title: Text(itemCard.title!),
                            subtitle: Text(itemCard.author!),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
  Widget searchHeader() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: TextField(
                onChanged: (value) => _filterItems(value),
                decoration: const InputDecoration(
                    isDense: true,
                    labelText: "Search",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(color: Colors.black54, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(color: Colors.black26, width: 2.0),
                    ),
                    suffixIcon: Icon(Icons.search)
                )
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text("Cancel"),),
        ),
      ],
    );
  }

}
