import 'package:flutter/material.dart';
import 'package:testflutter/app_data.dart';
import 'package:testflutter/widgets/trip_item.dart';

class Category_trips_screen extends StatelessWidget {
  // final String id;
  // final String title;
  //
  //  Category_trips_screen(this.id, this.title) ;

  @override
  Widget build(BuildContext context) {
    final r=
    ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    final cid=r['id'];
    final  ctitle=r['title'];
    final filter=Trips_data.where((element)
    {
      return element.categories.contains(cid);

    }
    ).toList();
    return Scaffold(
      appBar: AppBar(

        title: Text(ctitle!),
      ),
      body:ListView.builder(
        itemBuilder: (ctz,index)
        {
          return TripItem(
              id: filter[index].id,
              title: filter[index].title,
              imageUrl: filter[index].imageUrl,
              duration: filter[index].duration,
              tripType: filter[index].tripType,
              season: filter[index].season);
        },
        itemCount: filter.length,
      ),
    );
  }
}
