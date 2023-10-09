import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/new_controller.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/view/bottomnavigation/health.dart';
import 'package:newsapp/view/bottomnavigation/science.dart';
import 'package:newsapp/view/bottomnavigation/sports.dart';
class HomePage extends GetWidget{
  NewsController controller=Get.put(NewsController());
  List<Widget>screen=[
 Sports(),
    Science(),
    Health(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetX<NewsController>(builder: (controller)=> BottomNavigationBar(
        selectedItemColor: Colors.red,
        currentIndex:controller.currentIndex.value ,
        onTap: (val){
          controller.currentIndex.value=val;
        },
        items: [
          BottomNavigationBarItem(
              label: "Sports",
              icon: Icon(Icons.sports)),
          BottomNavigationBarItem(
              label: "Science",
              icon: Icon(Icons.science)),
          BottomNavigationBarItem(
              label: "health",
              icon: Icon(Icons.health_and_safety)),
        ],),),
      body: GetX<NewsController>(builder: (controller)=>screen[controller.currentIndex.value],),


    );
  }
  
}