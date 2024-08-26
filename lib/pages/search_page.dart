import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static final String id = "search_page";
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Search Page"),
    );
  }
}