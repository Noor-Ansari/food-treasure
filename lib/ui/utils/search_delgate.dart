import "package:flutter/material.dart";

import 'package:provider/provider.dart';

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
    final searchedData = model.filterResults(query);
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(searchedData[index].name),
        onTap: () => model.handleItemSelected(context, searchedData[index]),
      ),
      itemCount: searchedData.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    CustomSearchViewModel model = Provider.of<CustomSearchViewModel>(context);
    model.loadData(query);
    List<DishInfo> _suggestions =
        query.isEmpty ? model.searchHistory : model.filterSuggestions(query);

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.dining_outlined),
        minLeadingWidth: 12,
        title: RichText(
          text: TextSpan(
            text: _suggestions[index].name.substring(0, query.length),
            style: const TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: _suggestions[index].name.substring(query.length),
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        onTap: () => model.handleItemSelected(context, _suggestions[index]),
      ),
      itemCount: _suggestions.length,
    );
  }
}
