import 'package:ecommerce_app/core/theme/theme.dart';
import 'package:ecommerce_app/ui/tabs/wishlist_tab/wishlist_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: ()=>showResults(context), icon:Icon(Icons.search,size: 30.r,))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close,size: 30.r,));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if(query.isEmpty){
      return Container();
    }
    return Container();
  }
}