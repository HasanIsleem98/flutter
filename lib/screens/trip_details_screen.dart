import 'package:flutter/material.dart';
import 'package:testflutter/app_data.dart';

class TripDetailScreen extends StatelessWidget {
  Widget sectionTitle(BuildContext context ,text){
    return Container(

      alignment: Alignment.topRight,
      margin: EdgeInsets.only(right: 10),
      child: Text(text,style:TextStyle(fontSize: 30,color:Colors.lightBlueAccent)),
    );
  }
  Widget scs(Widget d){
return Container(
    decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.grey)
    ),
    height: 200,
    padding: EdgeInsets.all(10)
    ,margin: EdgeInsets.symmetric(horizontal: 10),
    child :d );
  }
  @override
  Widget build(BuildContext context) {
    final r=
    ModalRoute.of(context)!.settings.arguments as String;
    //هلأ احنا هون وصلنا ال id تاع الرجله من خلال هاد الرقم بدنا نعرف شو المعلومات تاعتو بالمختصر بدنا نعرف اي وحده تم اختيارها عن طريق هاد الا id  عشان نعرض هاي المعلومات
    // final cid=r['id'];
    //هون استخدمنا الفيرست وير لانو بدنا نبحث على عنصر واحد بس
    final selecttrips=Trips_data.firstWhere((element) => element.id==r);
    return Scaffold(
      appBar: AppBar(title: Text("${selecttrips.title}")),

      body:   SingleChildScrollView(
        child: Column(
         children: [
           Container(
             margin: EdgeInsets.all(15),
             height: 300,
             width: double.infinity,
             child: Image.network(selecttrips.imageUrl,fit: BoxFit.cover,),
           ),
           sectionTitle(context,"الأنشطة"),
           scs(
             ListView.builder(itemBuilder: (ctx,index)=>Card(

               child: Padding(
                 padding:const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                 child: Text("${selecttrips.activities[index]}"),
               ),



             ),



               itemCount: selecttrips.activities.length,



             ),


           ),
           sectionTitle(context,"البرنامج اليومي"),
           scs(
             ListView.builder(
               itemCount: selecttrips.program.length,
               itemBuilder: ( context, int index) =>Column(
                 children: [
                   ListTile(

                     leading:CircleAvatar(

                    child:   Text(" يوم  ${index+1}"),
                     ),
title: Text(selecttrips.program[index]),
                   ),
                   Divider(),
                 ],
               ),


             ),
           ),
      SizedBox(height:100),
         ],

        ),
      ),
    );



  }
}
