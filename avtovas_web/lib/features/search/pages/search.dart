import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_web/features/search/components/search_page_body.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: null),
        body: SearchPageBody());
  }
}
