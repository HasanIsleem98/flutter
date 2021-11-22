import 'package:flutter/material.dart';
import 'package:testflutter/screens/category_trips_screen.dart';
class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  CategoryItem(this.id,this.title, this.imageUrl);
void selectCategory(BuildContext ctx){
Navigator.of(ctx).pushNamed(
  '/category-tips',
  arguments: {
    'id':id,
    'title':title,
  }


);
}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Image.network(imageUrl,
            height: 250,
            fit: BoxFit.cover, //عشان اخلي الصوره تغطي ارتفاع الكونتينر الخارجي
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(fontSize: 30,color: Colors.white),
            ),
            decoration: BoxDecoration(          color: Colors.black.withOpacity(0.4)
                ,borderRadius: BorderRadius.circular(15)),
          ),
        ],
      ),
    );
  }

}
//شغلتو عرض عنصر واحد من التصنيفات