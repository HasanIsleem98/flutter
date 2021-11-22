import 'package:flutter/material.dart';
import 'package:testflutter/widgets/categories_item.dart';
import 'package:testflutter/app_data.dart';
class CategoryScreen extends StatelessWidget {

  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("دليل سياحي",),
      ),
      drawer: Drawer(),

     body: GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
       maxCrossAxisExtent: 200,
       childAspectRatio: 7/8,
       mainAxisSpacing: 10,
       crossAxisSpacing: 10,
     ),
        padding: EdgeInsets.all(10),
        children:
          Category_data.map((e) => CategoryItem(e.id,e.title, e.imageUrl)).toList()
        ),
    );
  }
}
