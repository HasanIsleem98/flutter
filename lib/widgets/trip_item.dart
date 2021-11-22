

import 'package:flutter/material.dart';
import 'package:testflutter/models/trips.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;

   TripItem({ required this.id,required this.title, required this.imageUrl, required this.duration, required this.tripType, required this.season});
  String get seasonText{
    if(season ==Season.Spring) {
      return "ربيع";
    }
    if(season ==Season.Summer) {
      return "صيف";
    }
    if(season ==Season.Winter) {
      return "شتاء";
    }
    if(season ==Season.Autumn) {
      return "خريف";
    }
    return " ";
  }
  String get Type{
    if(tripType ==TripType.Exploration) {
      return "استكشاف";
    }
    if(tripType ==TripType.Activities) {
      return "أنشطة";
    }
    if(tripType ==TripType.Recovery) {
      return "نقاهه";
    }
    if(tripType ==TripType.Therapy) {
      return "معالجة";
    }
    return " ";
  }

 void selectTrip(context){
Navigator.of(context).pushNamed('/trip-detial-screen',
arguments: id,

);
 }
  @override
  Widget build(BuildContext context) {
    return InkWell( // هاي منتستدعيها عشان يصير الاشي قابل للضغط
      onTap:()=> selectTrip(context) ,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  //هاي الويدجت منستخدمها لما بدنا نغير محتوى الابن اللي جواتها
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)
                  ),
                  child: Image.network(imageUrl,
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end:Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                    ],
                      stops: [
                        0.6,1 // هاي معنها انو من وين يبلش درجة الشفافية احنا هون حطينا انو يبلش من 60 بالميه من بداية الصورة
                      ]
                      ,
                    ),

                  ),
                  child: Text(title,style: TextStyle(
                    overflow: TextOverflow.fade,
                    fontSize: 30,
                    color: Colors.white,

                  ),),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
 mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.today, color:Colors.amberAccent),
                      Text("$duration أيام "),
                      SizedBox(width: 6),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.wb_sunny, color:Colors.amberAccent),
                      Text("$seasonText"),
                      SizedBox(width: 6),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.family_restroom, color:Colors.amberAccent),
                      Text("$Type"),
                      SizedBox(width: 6),
                    ],
                  ),


                ],
              ),

            ),
          ],

        ),

      ),

    );
  }
}
