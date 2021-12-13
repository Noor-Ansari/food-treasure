import "package:flutter/material.dart";

import 'package:provider/provider.dart';

import 'package:fooder/ui/widgets/search_item.dart';

import 'package:fooder/business_logic/models/dish_info.dart';
import 'package:fooder/business_logic/view_models/custom_search_view_model.dart';

class CustomSearch extends SearchDelegate<DishInfo?> {
  final String placeholder;

  CustomSearch({required this.placeholder})
      : super(searchFieldLabel: placeholder);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    CustomSearchViewModel model = Provider.of<CustomSearchViewModel>(context);
    final _searchedData = model.filterResults(query);
    return ListView.builder(
      itemBuilder: (context, index) => SearchItem(
        dish: _searchedData[index],
        query: query,
      ),
      itemCount: _searchedData.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    CustomSearchViewModel model = Provider.of<CustomSearchViewModel>(context);
    model.loadData(query);
    List<DishInfo> _suggestions =
        query.isEmpty ? model.searchHistory : model.filterSuggestions(query);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => SearchItem(
              dish: _suggestions[index],
              query: query,
            ),
            itemCount: _suggestions.length,
          ),
        ),
        if (query.isEmpty && model.searchHistory.isNotEmpty)
          TextButton(
            child: const Text("Clear search history"),
            onPressed: () => model.clearSearchHistory(),
          )
      ],
    );
  }
}
